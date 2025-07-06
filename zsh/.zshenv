#!/usr/bin/env zsh

# https://thevaluable.dev/zsh-install-configure-mouseless/
# Checkout: https://github.com/Phantas0s  - he writes and customises his zsh
export DOTFILES="$HOME/.dotfiles"
export XDG_CONFIG_HOME="$HOME/.config"

# Maybe it's pointless to export those parameters as env variables instead?
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"	  # Reconfigure default zsh location

export HISTFILE="$ZDOTDIR/.zhistory"   	  # History filepath
export HISTSIZE=100000                   # Maximum events for internal history
export SAVEHIST=100000                   # Maximum events in history file
