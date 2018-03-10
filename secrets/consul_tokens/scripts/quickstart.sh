#!/bin/bash

set -ue

# Set the default Vault addr. In this case use http instead of https as well.
export VAULT_ADDR=http://localhost:8200

# Set the default Consul addr and also disable https here.
export CONSUL_HTTP_ADDR=http://localhost:8500

# Enable the Consul Secrets backend.
vault secrets enable consul

# Using the default ACL master token (as set in the consul.hcl for this node),
# get a new management ACL token.
new_mgmt_token="$(http --json put "${CONSUL_HTTP_ADDR}/v1/acl/create" \
     X-Consul-Token:default_master_token \
     Type=management Name=new-mgmt-token | jq -r .ID)"

# For visibility, here is the new mgmt token...
echo "new ACL management token: ${new_mgmt_token}"

# Configre the Vault Consul Engine with the new ACL management token...
vault write consul/config/access \
      address=consul0.node.dc1.consul \
      token=${new_mgmt_token}

# Add a role for Consul client to request a Consul client token...
vault write consul/roles/consul-clients policy=$(base64 <<< 'key "" { policy = "read" }')

# Get a client token to feed to consul-client0...
vault read consul/creds/consul_clients
