#! /usr/bin/env bash

# Colors from askubuntu.com
reset=$(tput sgr0)
bold=$(tput bold)
black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)
user_color=$cyan

export CLICOLOR=1

# User Prompt Style
PS1="\[$reset\]\[$cyan\][ \[$bold\]\[$user_color\]\u@\h\
\[$reset\]\[$green\] \w\[$cyan\] ]\[$reset\]\[$reset\]\\$\[$reset\] "

# Custom Aliases
alias lsl='ls -lhF'
alias lsa='ls -lhaF'
alias vs='/Applications/Visual\ Studio.app/Contents/MacOS/VisualStudio &'
alias list-files='/Users/phil/git/CliAppBuilder/example.sh list'

function _update_ps1() {
    PS1="$(~/.powerline/powerline-go-darwin-amd64 -error $?)"
}

if [[ -f ~/git/privatekeys/.private_keys ]]; then
    source ~/git/privatekeys/.private_keys
fi

if [[ -f ~/.powerline/powerline-go-darwin-amd64 ]] && [[ "$TERM" != "linux" ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# added by Miniconda3 installer
export PATH="/Users/phil/.conda/bin:$PATH"
