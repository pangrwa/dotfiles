# DEFAULT SETTINGS
## Use emacs keybindings even if our EDITOR is set to vi
# bindkey -e

# Plugins
fpath=($DOTFILES/zsh/.config/zsh/plugins $fpath) # zsh-completions to look for completion files
source $DOTFILES/zsh/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $DOTFILES/zsh/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(fzf --zsh)"
# checkout zoxide - better cd plugin

# Keybindings
bindkey "^[[1;5C" forward-word     # Ctrl+Right
bindkey "^[[1;5D" backward-word    # Ctrl+Left

# Navigation
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# History
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

# Completion System
autoload -Uz compinit; compinit
_comp_options+=(globdots) # Allow completion to suggest hidden files

# Completion options and styling - I don't know what most of it does, it's the default recommended by zsh
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=/home/ruiwei/.config/starship/starship.toml


# aliases
if [ -f "$XDG_CONFIG_HOME/zsh/.zsh_aliases" ]; then
  source "$XDG_CONFIG_HOME/zsh/.zsh_aliases"
fi


if [ -f "$XDG_CONFIG_HOME/zsh/.zsh_color" ]; then
  source "$XDG_CONFIG_HOME/zsh/.zsh_color"
fi

# nvidia gpu programming
# export PATH=/usr/local/cuda-13.0/bin:$PATH
# export LD_LIBRARY_PATH=/usr/local/cuda-13.0/lib64:$LD_LIBRARY_PATH
