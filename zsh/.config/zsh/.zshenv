# this is hacky fix - everytime i open a new terminal instance, the previous environment
# variables seemed to be cached, resulting in my custom $ZDOTDIR to persist and affecting
# where the .zshenv is expected to be
source $HOME/.zshenv
