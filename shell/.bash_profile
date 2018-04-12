# .bash_profile
# Sam Harrison 2018
# MIT License: a full version of the license is included in the LICENSE file.

# .bash_profile is read by a login shell. Use this to set the key environment
# variables, and for any intensive operations that you may want to perform on
# startup, but not for any subsequent subprocesses (e.g. diagnostic information
# about the machine).

# http://www.gnu.org/software/bash/manual/bashref.html#Bash-Startup-Files
# https://superuser.com/a/789465
# https://superuser.com/a/789499
# https://superuser.com/a/183980
# https://unix.stackexchange.com/a/129144

#echo ".bash_profile"


## PATHS ETC ##

# Start by paths etc and doing shell-independent config
if [ -r "${HOME}/.profile" ]; then
    . "${HOME}/.profile"
fi


## CONDA ##
if [ -r "${CONDA_DIR}/etc/profile.d/conda.sh" ]; then
    . "${CONDA_DIR}/etc/profile.d/conda.sh"
    conda activate "${CONDA_DEFAULT_ENV}"
fi

## HISTORY ##

HISTSIZE=5000
HISTFILESIZE=10000
# Don't store immediate duplicates
HISTCONTROL=ignoredups
export HISTSIZE HISTFILESIZE HISTCONTROL

# Append rather than overwrite history
shopt -s histappend


## EDITORS ETC ##

# Used to show output a screen at a time
PAGER=less
export PAGER

# Prefered editor for text files
EDITOR=vim
VISUAL="${EDITOR}"
export EDITOR VISUAL

# Prompt
# https://ss64.com/bash/syntax-prompt.html
# Username: \u; Hostname: \H; working dir: \w
green='\[\e[0;32m\]'
grey='\[\e[0;37m\]'
bold_grey='\[\e[1;37m\]'
cr='\[\e[0m\]'
#PS1="${green}\u${cr}${grey}@${cr}${green}\H${cr}${grey}:\w${cr}${bold_grey} \$ ${cr}"
PS1="${green}\u${cr}${grey}@${cr}${green}MBP${cr}${grey}:\w${cr}${bold_grey} \$ ${cr}"
export PS1


## BASHRC ##

# And finally load aliases etc for interactive shells
if [ -r "${HOME}/.bashrc" ]; then
    . "${HOME}/.bashrc"
fi
