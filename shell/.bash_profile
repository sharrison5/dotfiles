# .bash_profile
# Sam Harrison 2018
# MIT License: a full version of the license is included in the LICENSE file.

# .bash_profile is read by a login shell. Use this to set the key environment
# variables, and for any intensive operations that you may want to perform on
# startup, but not for any subsequent subprocesses (e.g. diagnostic information
# about the machine).
# The exported environment variables will be inherited by any subshells /
# subprocesses, so we should only need to set them once here (and in
# .profile and .local_profile etc). Subprocesses will be run by non-login,
# non-interactive shells. Starting a terminal in an existing session will
# open a non-login, interactive shell. For these, we need to update any
# useful settings that are not inherited (e.g. aliases), and we do this
# via .bashrc (and friends).
# Note that this distinction is important because e.g. setting $PATH is
# not idempotent, so to prevent an ever expanding $PATH we should (1) only
# export environment variables from .*profile* files, and (2) should not
# source .*profile* files from .*rc files.

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
# Username: \u; Hostname: \h,\H; working dir: \w,\W
# For format codes see:
# https://stackoverflow.com/a/33206814
# https://misc.flogisoft.com/bash/tip_colors_and_formatting
cyan='\[\e[0;36m\]'; cyan_bu='\[\e[1;4;36m\]'
grey='\[\e[0;37m\]'; grey_b='\[\e[1;37m\]'
cr='\[\e[0m\]'
if [ -n "$SSH_CLIENT" ]; then
    MACHINE_COLOUR="${cyan_bu}"
else
    MACHINE_COLOUR="${cyan}"
fi
PS1="${cyan}\u${cr}${grey}@${cr}${MACHINE_COLOUR}${MACHINE_NAME}${cr}${grey}:\W${cr}${grey_b} \$ ${cr}"
export PS1


## BASHRC ##

# Load aliases etc for interactive shells
if [ -r "${HOME}/.bashrc" ]; then
    . "${HOME}/.bashrc"
fi


## LOCAL COMMANDS ##

# And finally run any machine specific commands
if [ -r "${HOME}/.local_profile" ]; then
    . "${HOME}/.local_profile"
fi
