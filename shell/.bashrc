# .bashrc
# Sam Harrison 2018
# MIT License: a full version of the license is included in the LICENSE file.

# .bashrc gets invoked by interactive, non-login shells (e.g. a new terminal
# window in a graphical session; note that all shells are login for macOS).
# As most of the key environment variables are inherited from the login
# shell via .bash_profile, this is fairly lightweight and should just contain
# what isn't inherited (e.g. aliases).
# See .bash_profile for some useful links.

#echo ".bashrc"

# https://unix.stackexchange.com/q/257571
# If not running interactively, don't do anything
[[ $- != *i* ]] && return


## ALIASES ##

if [ -r "${HOME}/.bash_aliases" ]; then
    . "${HOME}/.bash_aliases"
fi


## BASH COMPLETION ##

if [ -r /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi
