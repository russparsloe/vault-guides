#!/bin/bash


export VAULT_ADDR=http://localhost:8200
export CONSUL_HTTP_ADDR=http://localhost:8500

vault secrets enable consul

http --json put "${CONSUL_HTTP_ADDR}/v1/acl/create \
     X-Consul-Token:default-mgmt-token \
     Type=management Name=new-mgmt-token

# vault write consul/config/access 

     
