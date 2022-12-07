# 1. Vendored dependencies
#   a. pure prompt
fpath+=("$XDG_CONFIG_HOME/zsh/vendored/pure")
autoload -U promptinit; promptinit
prompt pure
#   b. zsh-syntax-highlighting
source "$XDG_CONFIG_HOME/zsh/vendored/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# 2. Load env config data
while IFS=',' read -r action name value
do
	if [ "$action" = "set" ]; then
		export $name="$value"
	elif [ "$action" = "append" ]; then
		eval "export $name=\"\$$name:$value\""
	elif [ "$action" = "prepend" ]; then
		eval "export $name=\"$value:\$$name\""
	else
		echo "Unknown env action: $action"
	fi
done < $XDG_CONFIG_HOME/_env/*.csv

# 3. Load alias config data
while IFS=',' read -r name command
do
	alias "$name"="$command"
done < $XDG_CONFIG_HOME/_aliases/*.csv

# 4. Load up development platforms
#   a. Load the default opam switch if an OCaml environment is detected
if which opam > /dev/null; then
	eval $(opam env --switch=default)
fi
