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

alias ls='ls -p'
alias la='ls -a'
alias ll='ls -lAh'
# OS specific options (N.B. use `/bin/ls` as we want to make sure we use the
# version bundled with the system, and not any different versions)
# https://stackoverflow.com/a/18434831
case $(uname) in
    "Linux")
        alias ls='/bin/ls --color=auto -p'
        alias ll='ls -lAh --time-style=long-iso'
        ;;
    "Darwin" | "FreeBSD")
        alias ls='/bin/ls -G -p'
        alias ll='ls -lAh -T'
        ;;
esac


## RSYNC ##

alias rsync='rsync --verbose --human-readable --progress --stats'


## SUDO ##

# Lets local aliases be used with sudo
alias sudo='sudo '


## WEATHER ##

# https://github.com/chubin/wttr.in
alias weather='curl "wttr.in/${WTTR_LOCATION}"'
alias weather_short='curl "wttr.in/${WTTR_LOCATION}?format=3"'
