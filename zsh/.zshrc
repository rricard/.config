# 1. Vendored dependencies
#   a. pure prompt
fpath+=("$XDG_CONFIG_HOME/zsh/vendored/pure")
autoload -U promptinit; promptinit
prompt pure
#   b. zsh-syntax-highlighting
source "$XDG_CONFIG_HOME/zsh/vendored/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# 2. Load alias config data
while IFS=',' read -r name command
do
  alias "$name"="$command"
done < $XDG_CONFIG_HOME/aliases/*.csv
