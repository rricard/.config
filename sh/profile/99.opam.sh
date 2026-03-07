#!/usr/bin/env sh

# Load the default opam switch if an OCaml environment is detected
if which opam > /dev/null; then
	eval $(opam env)
fi
