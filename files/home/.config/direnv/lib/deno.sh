use_deno() {
    local version

    if ! version=${1:-$(tool_version deno)} || [[ -z $version ]]; then
        log_error "Unable to find Deno version specification"
        return 1
    fi

    if [[ -z $version ]]; then
        log_error "Version for Deno is missing"
        return 1
    fi

    if [[ -z ${DENO_VERSIONS:-} ]]; then
        log_error "Environment variable DENO_VERSIONS is unset or empty"
        return 1
    fi

    local prefix=$DENO_VERSIONS/$DENO_VERSION_PREFIX$version

    if [[ ! -d $prefix ]]; then
        log_error "Unable to find Deno $version in $DENO_VERSIONS"
        return 1
    fi

    if [[ ! -x $prefix/bin/deno ]]; then
        log_error "Unable to find Deno binary in $prefix/bin"
        return 1
    fi

    load_prefix "$prefix"

    log_status "Successfully loaded Deno $version from $prefix"
}

