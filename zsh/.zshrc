# 1. Vendored dependencies
#   a. pure prompt
fpath+=("$XDG_CONFIG_HOME/zsh/vendored/pure")
autoload -U promptinit; promptinit
prompt pure
#   b. zsh-syntax-highlighting
source "$XDG_CONFIG_HOME/zsh/vendored/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# 2. Load env config data
#   a. Set env vars
while IFS=',' read -r name value
do
  export $name="$value"
done < $XDG_CONFIG_HOME/env/set-*.csv
#   b. Append env vars
while IFS=',' read -r name value
do
  eval "export $name=\"\$$name:$value\""
done < $XDG_CONFIG_HOME/env/append-*.csv

# 3. Load alias config data
while IFS=',' read -r name command
do
  alias "$name"="$command"
done < $XDG_CONFIG_HOME/aliases/*.csv
