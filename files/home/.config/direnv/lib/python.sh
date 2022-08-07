use_python() {
    local version=$1

    if [[ -z $version ]]; then
        log_error "missing python version"
        return 1
    fi

    if [[ -z ${PYTHON_VERSIONS:-} ]]; then
        log_error "PYTHON_VERSIONS is unset or empty"
        return 1
    fi

    local prefix=$PYTHON_VERSIONS/$PYTHON_VERSION_PREFIX$version

    if [[ ! -d $prefix ]]; then
        log_error "python version $version does not exist"
        return 1
    fi

    if [[ ! -x $prefix/bin/python ]]; then
        log_error "python binary not found"
        return 1
    fi

    load_prefix "$prefix"

    log_status "loaded python $version from $prefix"
}

layout_python() {
    local python=${1:-python}
    (($# > 0)) && shift

    if [[ -n ${VIRTUAL_ENV:-} ]]; then
        local REPLY
        realpath.absolute "$VIRTUAL_ENV"
        VIRTUAL_ENV=$REPLY
    else
        local version
        version=$("$python" -c "import platform; print(platform.python_version())")
        VIRTUAL_ENV=$(direnv_layout_dir)/python-$version
    fi

    if [[ ! -d $VIRTUAL_ENV ]]; then
        "$python" -m venv "$@" "$VIRTUAL_ENV"
    fi

    export VIRTUAL_ENV
    PATH_add "$VIRTUAL_ENV"/bin
}
