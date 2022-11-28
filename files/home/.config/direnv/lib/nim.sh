use_nim() {
    local version

    if ! version=${1:-$(tool_version nim)}; then
        log_error "Unable to find Nim version specification"
        return 1
    fi

    if [[ -z $version ]]; then
        log_error "Version for Nim is missing"
        return 1
    fi

    if [[ -z ${NIM_VERSIONS:-} ]]; then
        log_error "Environment variable NIM_VERSIONS is unset or empty"
        return 1
    fi

    local prefix=$NIM_VERSIONS/$NIM_VERSION_PREFIX$version

    if [[ ! -d $prefix ]]; then
        log_error "Unable to find Nim $version in $NIM_VERSIONS"
        return 1
    fi

    if [[ ! -x $prefix/bin/nim ]]; then
        log_error "Unable to find Nim binary in $prefix/bin"
        return 1
    fi

    load_prefix "$prefix"

    log_status "Successfully loaded Nim $version from $prefix"
}
