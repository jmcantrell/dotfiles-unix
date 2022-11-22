use_zig() {
    local version

    if ! version=${1:-$(tool_version zig)} || [[ -z $version ]]; then
        log_error "Unable to find Zig version specification"
        return 1
    fi

    if [[ -z ${ZIG_VERSIONS:-} ]]; then
        log_error "Environment variable ZIG_VERSIONS is unset or empty"
        return 1
    fi

    local prefix=$ZIG_VERSIONS/$ZIG_VERSION_PREFIX$version

    if [[ ! -d $prefix ]]; then
        log_error "Unable to find Zig $version in $ZIG_VERSIONS"
        return 1
    fi

    if [[ ! -x $prefix/bin/zig ]]; then
        log_error "Unable to find Zig binary in $prefix/bin"
        return 1
    fi

    load_prefix "$prefix"

    log_status "Successfully loaded Zig $version from $prefix"
}
