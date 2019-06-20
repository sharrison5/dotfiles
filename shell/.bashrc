# .bashrc
# Sam Harrison 2018
# MIT License: a full version of the license is included in the LICENSE file.

# .bashrc gets invoked by interactive, non-login shells (e.g. a new terminal
# window in a graphical session; note that all shells are login for macOS).
# Most of the key environment variables are inherited from the login shell
# via .bash_profile, so this should just contain:
#  + What isn't inherited (e.g. aliases).
#  + Anything specific to interactive shells.

# Note that we typically shouldn't export variables related to interactive
# sessions only, they are not meant to be inherited:
# https://unix.stackexchange.com/a/197333
# https://unix.stackexchange.com/q/247585

# See .profile for some useful links.


#echo ".bashrc"


# https://unix.stackexchange.com/q/257571
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


## ALIASES ##

for alias_file in "$HOME"/.*_aliases; do
    if [ -r "$alias_file" ]; then
        . "$alias_file"
    fi
done
unset alias_file


## BASH COMPLETION ##

if [ -r "/opt/local/etc/profile.d/bash_completion.sh" ]; then
    . "/opt/local/etc/profile.d/bash_completion.sh"
fi
if [ -r "/usr/share/bash-completion/bash_completion" ]; then
    . "/usr/share/bash-completion/bash_completion"
fi


## CONDA ##

# `conda` is a function so this needs to be sourced every time (not inherited).
if [ -n "${CONDA_DIR}" ] && [ -d "${CONDA_DIR}" ]; then
    # conda init --dry-run --verbose
    __conda_setup="$("${CONDA_DIR}/bin/conda" 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -r "${CONDA_DIR}/etc/profile.d/conda.sh" ]; then
            . "${CONDA_DIR}/etc/profile.d/conda.sh"
        else
            export PATH="${CONDA_DIR}/bin:$PATH"
        fi
    fi
    unset __conda_setup
elif [ -n "${CONDA_DIR}" ] && [ ! -d "${CONDA_DIR}" ]; then
    echo ".bashrc: \$CONDA_DIR set but not a directory!" 1>&2
fi


## HISTORY ##

HISTSIZE=5000
HISTFILESIZE=10000
# Don't store immediate duplicates
HISTCONTROL=ignoredups

# Append rather than overwrite history
shopt -s histappend


## PROMPT ##

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
unset cyan cyan_bu grey grey_b cr


## SHELL BEHAVIOUR ##

# Turn on '**' globbing
shopt -s globstar
