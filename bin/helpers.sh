#!/usr/bin/env bash


get_platform_name() {
    if [[ "$(uname)" = "Linux" ]] ; then
        echo "linux"
    else
        echo "darwin"
    fi
}

get_architecture_name() {
    echo "amd64"
}

# curl https://binaries.cockroachdb.com/cockroach-v17.1.3.darwin-10.9-amd64.tgz
# wget -qO- https://binaries.cockroachdb.com/cockroach-v17.1.3.linux-amd64.tgz | tar  xvz
get_directory_name() {
    plat="$(get_platform_name)"
    arch="$(get_architecture_name)"
    if [[ "${plat}" == "darwin" ]] ; then
        echo "cockroach-v$1.${plat}-10.9-${arch}"
    else
        echo "cockroach-v$1.${plat}-${arch}"
    fi
}

get_archive_name() {
    dir_name="$(get_directory_name "$1")"

    echo "${dir_name}.tgz"
}

