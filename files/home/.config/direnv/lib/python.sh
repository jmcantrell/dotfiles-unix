use_python() {
    local version
    version=${1:-$(tool_version python)}

    if [[ -z $version ]]; then
        log_error "Version for Python is missing"
        return 1
    fi

    if [[ -z ${PYTHON_VERSIONS:-} ]]; then
        log_error "Environment variable PYTHON_VERSIONS is unset or empty"
        return 1
    fi

    local prefix=$PYTHON_VERSIONS/$PYTHON_VERSION_PREFIX$version

    if [[ ! -d $prefix ]]; then
        log_error "Unable to find Python $version in $PYTHON_VERSIONS"
        return 1
    fi

    if [[ ! -x $prefix/bin/python ]]; then
        log_error "Unable to find Python binary in $prefix/bin"
        return 1
    fi

    load_prefix "$prefix"

    log_status "Successfully loaded Python $version from $prefix"
}

layout_python() {
    local python=${1:-python}
    (($# > 0)) && shift

    local version
    version=$("$python" -c "import platform; print(platform.python_version())")

    local layout_dir
    layout_dir=$(direnv_layout_dir)/python-$version

    VIRTUAL_ENV=$layout_dir/venv

    if [[ ! -d $VIRTUAL_ENV ]]; then
        "$python" -m venv "$@" "$VIRTUAL_ENV"
    fi

    export VIRTUAL_ENV
    PATH_add "$VIRTUAL_ENV"/bin
}
