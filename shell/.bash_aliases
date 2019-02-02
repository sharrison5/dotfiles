# .bash_aliases
# Sam Harrison 2018
# MIT License: a full version of the license is included in the LICENSE file.

# Use `alias` to list defined aliases

# To check for name collisions with built-ins/commands/keywords:
# compgen -bck | sort | less
# https://stackoverflow.com/a/949006

# Aliases in single quotes by default: we typically want to evaluate
# variables within them when used, rather than when declared.
# This is also consistent with the `alias` command.


#echo ".bash_aliases"


## GREP ##

alias grep='grep --color=auto'


## LS ##

# https://stackoverflow.com/a/18434831
case $(uname) in
    "Linux")
        alias ls='/bin/ls --color=auto -p'
        ;;
    "Darwin" | "FreeBSD")
        alias ls='/bin/ls -G -p'
        ;;
    *)
        alias ls='ls -p'
esac
alias la='ls -a'
alias ll='ls -lah'


## RSYNC ##

alias rsync='rsync --verbose --human-readable --progress --stats'


## PYTHON ##

alias ipy='ipython'
alias ipylab='ipython --profile=basics --matplotlib'

alias jn='jupyter notebook'


## WEATHER ##

# https://github.com/chubin/wttr.in
alias weather='curl wttr.in/$WTTR_LOCATION'
