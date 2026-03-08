#!/usr/bin/env sh

# shellcheck disable=SC1090
for f in "$XDG_CONFIG_HOME"/sh/profile/*.sh; do . "$f"; done
