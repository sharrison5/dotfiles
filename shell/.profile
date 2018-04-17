# .profile
# Sam Harrison 2018
# MIT License: a full version of the license is included in the LICENSE file.

# .profile is for the Bourne shell, and is used as for setting options that
# we want for all shells (e.g. $PATH and friends). It must therefore be
# compatible with all /bin/sh variants.
# See .bash_profile for some useful links.

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
