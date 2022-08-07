use_ruby() {
    local version
    version=${1:-$(tool_version ruby)}

    if [[ -z $version ]]; then
        log_error "Version for Ruby is missing"
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

layout_ruby() {
    local ruby=${1:-ruby}

    local version
    version=$("$ruby" -e "puts RUBY_VERSION")

    local layout_dir
    layout_dir=$(direnv_layout_dir)/ruby-$version

    export GEM_HOME=$layout_dir/gems
    export BUNDLE_BIN=$layout_dir/bin

    PATH_add "$GEM_HOME/bin"
    PATH_add "$BUNDLE_BIN"
}
