#!/usr/bin/env bash

for f in $XDG_CONFIG_HOME/bash/run_commands/*.sh; do . $f; done
