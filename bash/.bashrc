#! /bin/env bash

# Environment setup
if [ -f "$HOME/.env" ]; then
    # shellcheck source=/dev/null
    source "$HOME/.env"
fi

# Aliases
if [ -f "$HOME/.aliases" ]; then
    # shellcheck source=/dev/null
    source "$HOME/.aliases"
fi


