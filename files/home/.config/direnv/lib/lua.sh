use_lua() {
    local version

    if ! version=${1:-$(tool_version lua)} || [[ -z $version ]]; then
        log_error "Unable to find Lua version specification"
        return 1
    fi

    if [[ -z ${LUA_VERSIONS:-} ]]; then
        log_error "Environment variable LUA_VERSIONS is unset or empty"
        return 1
    fi

    local prefix=$LUA_VERSIONS/$LUA_VERSION_PREFIX$version

    if [[ ! -d $prefix ]]; then
        log_error "Unable to find Lua $version in $LUA_VERSIONS"
        return 1
    fi

    if [[ ! -x $prefix/bin/lua ]]; then
        log_error "Unable to find Lua binary in $prefix/bin"
        return 1
    fi

    load_prefix "$prefix"

    log_status "Successfully loaded Lua $version from $prefix"
}
