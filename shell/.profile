# .profile
# Sam Harrison 2018
# MIT License: a full version of the license is included in the LICENSE file.

## OVERVIEW ##

# On login, the shell will source .${SHELL}_profile, or, if that is not
# present, .profile. Therefore, we use this to set the key environment
# variables and for any intensive operations that you may want to perform on
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


## CAVEATS ##

# .profile is for the Bourne shell, and is used as for setting options that
# we want for all shells (e.g. $PATH and friends). It must therefore be
# compatible with all /bin/sh variants.


## REFERENCES ##

# http://mywiki.wooledge.org/DotFiles
# http://www.gnu.org/software/bash/manual/bashref.html#Bash-Startup-Files
# https://superuser.com/a/789465
# https://superuser.com/a/789499
# https://superuser.com/a/183980
# https://unix.stackexchange.com/a/129144
# https://askubuntu.com/a/132319


#echo ".profile"


## CONFIG ##

if [ -r "${HOME}/.machine_specific_config" ]; then
    . "${HOME}/.machine_specific_config"
fi


## PATH ##

# Can assume this is already set

if [ -d "${HOME}/bin" ]; then
    PATH="${PATH}:${HOME}/bin"
fi

# MacPorts
# export PATH="/opt/local/bin:/opt/local/sbin:${PATH}"
if [ -d /opt/local/sbin ]; then
    PATH="/opt/local/sbin:${PATH}"
fi
if [ -d /opt/local/bin ]; then
    PATH="/opt/local/bin:${PATH}"
fi


## LD_LIBRARY_PATH ##

if [ -d "${HOME}/lib" ]; then
    # https://stackoverflow.com/a/16296466
    LD_LIBRARY_PATH="${HOME}/lib${LD_LIBRARY_PATH:+:}${LD_LIBRARY_PATH}"
    export LD_LIBRARY_PATH
fi


## EDITORS ETC ##

# Used to show output a screen at a time
PAGER=less
export PAGER

# Prefered editor for text files
EDITOR=vim
VISUAL="${EDITOR}"
export EDITOR VISUAL


## CONDA ##

if [ -r "${CONDA_DIR}/etc/profile.d/conda.sh" ]; then
    . "${CONDA_DIR}/etc/profile.d/conda.sh"
    conda activate "${CONDA_DEFAULT_ENV}"
fi


## FSL ##

if [ -d "${FSLDIR}" ]; then
    PATH="${FSLDIR}/bin:${PATH}"
    . "${FSLDIR}/etc/fslconf/fsl.sh"
    . "${FSLDIR}/etc/fslconf/fsl-devel.sh"
fi


## LOCAL COMMANDS ##

# And finally run any machine specific commands
if [ -r "${HOME}/.local_profile" ]; then
    . "${HOME}/.local_profile"
fi
