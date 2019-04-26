# .profile
# Sam Harrison 2018
# MIT License: a full version of the license is included in the LICENSE file.

## OVERVIEW ##

# On login, the shell will source .${SHELL}_profile, or, if that is not
# present, .profile. Therefore, we use this to set the key environment
#variables and for any intensive operations that you may want to perform on
# startup, but not for any subsequent subprocesses (e.g. diagnostic information
# about the machine).

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


## REFERENCES ##

# http://mywiki.wooledge.org/DotFiles
# http://www.gnu.org/software/bash/manual/bashref.html#Bash-Startup-Files
# https://superuser.com/a/789465
# https://superuser.com/a/789499
# https://superuser.com/a/183980
# https://unix.stackexchange.com/a/129144
# https://askubuntu.com/a/132319


## CAVEATS ##

# .profile is for the Bourne shell, and is used as for setting options that
# we want for all shells (e.g. $PATH and friends). It must therefore be
# compatible with all /bin/sh variants.

# http://mywiki.wooledge.org/Bashism
# https://unix.stackexchange.com/a/369061
# https://wiki.ubuntu.com/DashAsBinSh


#echo ".profile"


## DEBUG ##

#export PROFILE_SHELL=$SHELL
#export PROFILE_TIME=$(date)
#export PROFILE_0=$0


## CONFIG ##

if [ -r "${HOME}/.local_config" ]; then
    . "${HOME}/.local_config"
fi


## PATH ##

# Can assume this is already set

if [ -d "${HOME}/bin" ]; then
    PATH="${HOME}/bin:${PATH}"
fi

# MacPorts
# export PATH="/opt/local/bin:/opt/local/sbin:${PATH}"
if [ -d "/opt/local/sbin" ]; then
    PATH="/opt/local/sbin:${PATH}"
fi
if [ -d "/opt/local/bin" ]; then
    PATH="/opt/local/bin:${PATH}"
fi


## LD_LIBRARY_PATH ##

if [ -d "${HOME}/lib" ]; then
    if [ -n "${LD_LIBRARY_PATH}" ]; then
        export LD_LIBRARY_PATH="${HOME}/lib:${LD_LIBRARY_PATH}"
    else
        export LD_LIBRARY_PATH="${HOME}/lib"
    fi
fi


## EDITORS ETC ##

# Used to show output a screen at a time
export PAGER=less

# Prefered editor for text files
export EDITOR=vim
export VISUAL="${EDITOR}"


## CONDA ##

# This sets the default environment but, annoyingly, `conda` is a function
# so we need to source conda.sh again for interactive shells.
if [ -n "${CONDA_DEFAULT_ENV}" ] && [ -n "${CONDA_DIR}" ]; then
    if [ -r "${CONDA_DIR}/etc/profile.d/conda.sh" ]; then
        echo "Activating default conda env (${CONDA_DEFAULT_ENV})..."
        . "${CONDA_DIR}/etc/profile.d/conda.sh"
        conda activate "${CONDA_DEFAULT_ENV}"
        echo "...activated"
    else
        echo ".profile: \$CONDA_DIR set but could not source conda.sh!" 1>&2
    fi
fi


## FSL ##

if [ -n "${FSLDIR}" ]; then
    if  [ -d "${FSLDIR}" ]; then
        echo "Activating FSL (${FSLDIR})..."
        PATH="${FSLDIR}/bin:${PATH}"
        . "${FSLDIR}/etc/fslconf/fsl.sh"
        . "${FSLDIR}/etc/fslconf/fsl-devel.sh"
        echo "...activated"
    else
        echo ".profile: \$FSLDIR set but not a directory!" 1>&2
    fi
fi


## LOCAL COMMANDS ##

# And finally run any machine specific commands
if [ -r "${HOME}/.local_profile" ]; then
    . "${HOME}/.local_profile"
fi
