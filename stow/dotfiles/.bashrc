#!/usr/bin/env bash

# set prompt
PS1='\$ '

# common shell resources
[[ -f ~/.shrc ]] && . ~/.shrc

# omit duplicates or lines starting with a space
HISTCONTROL=ignoreboth

# append vs overwrite
shopt -s histappend

HISTSIZE=15000
HISTFILESIZE=10000

# update LINES and COLUMNS after each command
shopt -s checkwinsize
