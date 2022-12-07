# 1. Vendored dependencies
#   a. pure prompt
fpath+=("$XDG_CONFIG_HOME/zsh/vendored/pure")
autoload -U promptinit; promptinit
prompt pure
#   b. zsh-syntax-highlighting
source "$XDG_CONFIG_HOME/zsh/vendored/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
