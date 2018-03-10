#!/bin/bash

[ ! -n "$DEBUG" ] || set -x

set -u

function main () {

    if ! command -v inspec > /dev/null 2>&1 ; then
	echo "Did not find require InSpec in path. If you'd like to run validation tests please install InSpec: https://inspec.chef.io."
	exit -1
    fi

    basedir="$(dirname $0)/../"
    pushd "${basedir}" > /dev/null 2>&1
    
    cd "$(dirname $0)/../"
    RUBYOPY=-W2 inspec exec validate.d/inspec

    popd > /dev/null 2>&1
}

main
