# Bash aliases
# vim: set filetype=sh:

# Custom environment variables
export GIT_PAGER='less -r' # interpret ^M correctly
export MANPAGER='less -X'  # dont clean man pages on exit

alias cls='clear'                     # shortcut to clear
alias tmux='tmux -2'                  # tell tmux to support 256 colors
alias dush="du -sm *|sort -n|tail"    # find large files/directories
alias untar='tar -xvf'                # most common kind of untar command
alias go='gnome-open'                 # launch any file with its default application
alias citrix='/usr/lib/ICAClient.11/wfica.sh'
alias pgrep='pgrep -l'                # make pgrep show process name by default
alias hacktime='killall metacity && awesome & disown' # replace metacity with awesome

# xargs vim : lets you start vim with piped arguments
xvim() {
xargs sh -c "</dev/tty vim $@ \$*" 
}

# backup 
bkup() {
    cp $1{,.bak}
}

# Create an epub file from an unzipped epub folder
# usage: epub my-book.epub
function epub()
{
    rm -f $@; zip -q0X $@ mimetype; zip -qXr9D $@ *
}

# Clear screen, but without moving the cursor to the top
function c()
{
    printf "\33[2J"
}

# Simulate keyboard typing a message
termsay () 
{ 
    if [ $# -eq 0 ];      then return;
    elif [ "$1" == '-' ]; then pv -qL 10 <&0  # pipe from stdin
    else                  echo $@ | pv -qL 10 # use args
    fi
}
