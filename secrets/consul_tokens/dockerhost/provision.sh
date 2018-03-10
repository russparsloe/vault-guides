#!/bin/bash

[ ! -n "$DEBUG" ] || set -x

set -ue

# the internet says this is better than 'set -e'
function onerr {
    echo 'Cleaning up after error...'
    exit -1
}
trap onerr ERR


function dependencies_install () {
    apt-get update
    apt-get install -y python3-pip wget curl
}


function docker_compose_install () {
    pip3 install -r /vagrant/requirements.txt
}


function inspec_install () {
    if ! command -v inspec > /dev/null 2>&1 ; then
	curl https://omnitruck.chef.io/install.sh | bash -s -- -P inspec
    fi
}


function docker_compose_run () {
    (cd /vagrant && make)
}


function main() {
    dependencies_install
    docker_compose_install
    inspec_install
    #docker_compose_run
}

main
