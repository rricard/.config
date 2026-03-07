# 1. Vendored dependencies
#   a. pure prompt
fpath+=("$XDG_CONFIG_HOME/zsh/vendored/pure")
autoload -U promptinit; promptinit
prompt pure
#   b. zsh-syntax-highlighting
source "$XDG_CONFIG_HOME/zsh/vendored/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# 2. Load env config data
for f in $XDG_CONFIG_HOME/_env/*.sh; do source $f; done

# 3. Load alias config data
for f in $XDG_CONFIG_HOME/_aliases/*.sh; do source $f; done

# 4. Set up zsh settings
#   a. cdpath
cdpath=(~/faves)

# 4. Load up development platforms
#   a. load homebrew on arm64 macs
if [ -d /opt/homebrew/bin ]; then
	eval "$(/opt/homebrew/bin/brew shellenv)" 
fi
#   b. Load the default opam switch if an OCaml environment is detected
if which opam > /dev/null; then
	eval $(opam env)
fi
