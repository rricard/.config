#!/usr/bin/env bash

# shellcheck disable=SC1090
for f in "$XDG_CONFIG_HOME"/bash/run_commands/*.sh; do . "$f"; done
