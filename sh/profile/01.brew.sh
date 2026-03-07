#!/usr/bin/env sh

# load homebrew on arm64 macs
if [ -d /opt/homebrew/bin ]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi