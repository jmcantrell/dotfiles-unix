use_node() {
    local version

    if ! version=${1:-$(tool_version node .nvmrc)}; then
        log_error "Unable to find NodeJS version specification"
        return 1
    fi

    if [[ -z $version ]]; then
        log_error "Version for NodeJS is missing"
        return 1
    fi

    if [[ -z ${NODE_VERSIONS:-} ]]; then
        log_error "Environment variable NODE_VERSIONS is unset or empty"
        return 1
    fi

    local prefix=$NODE_VERSIONS/$NODE_VERSION_PREFIX$version

    if [[ ! -d $prefix ]]; then
        log_error "Unable to find NodeJS $version in $NODE_VERSIONS"
        return 1
    fi

    if [[ ! -x $prefix/bin/node ]]; then
        log_error "Unable to find NodeJS binary in $prefix/bin"
        return 1
    fi

    load_prefix "$prefix"

    log_status "Successfully loaded NodeJS $version from $prefix"
}
