# Bash aliases
# vim: set filetype=sh:

alias cls='clear'                     # shortcut to clear
alias tmux='tmux -2'                  # tell tmux to support 256 colors
alias dush="du -sm *|sort -n|tail"    # find large files/directories
alias untar='tar -xf'                 # most common kind of untar command

# xargs vim : lets you start vim with piped arguments
xvim() {
xargs sh -c "</dev/tty vim $@ \$*" 
}
