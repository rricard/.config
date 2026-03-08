#!/usr/bin/env sh

# OCaml
if which opam > /dev/null; then
	eval "$(opam env)"
fi
