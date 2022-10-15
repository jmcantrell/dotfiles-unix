use_ruby() {
    local version

    if ! version=${1:-$(tool_version ruby)} || [[ -z $version ]]; then
        log_error "Unable to find Ruby version specification"
        return 1
    fi

    if [[ -z ${RUBY_VERSIONS:-} ]]; then
        log_error "Environment variable RUBY_VERSIONS is unset or empty"
        return 1
    fi

    local prefix=$RUBY_VERSIONS/$RUBY_VERSION_PREFIX$version

    if [[ ! -d $prefix ]]; then
        log_error "Unable to find Ruby $version in $RUBY_VERSIONS"
        return 1
    fi

    if [[ ! -x $prefix/bin/ruby ]]; then
        log_error "Unable to find Ruby binary in $prefix/bin"
        return 1
    fi

    load_prefix "$prefix"

    log_status "Successfully loaded Ruby $version from $prefix"
}
