# .bash_profile
# Sam Harrison 2018
# MIT License: a full version of the license is included in the LICENSE file.

# .bash_profile is read if the login shell is bash. It therefore has two
# main roles:
#  + Source any global settings from .profile
#  + If the shell is interactive, source .bashrc

# Note that we try and minimise what we place in this file, as it may not
# be sourced at all! For example, on Ubuntu the default login shell is dash.
# That means .bash_profile cannot safely be sourced by e.g. Gnome, and we also
# shouldn't source it from .bashrc (see .profile for an explanation of the
# different roles these files have).

# https://wiki.ubuntu.com/DashAsBinSh
# https://bugs.launchpad.net/ubuntu/+bug/66004


#echo ".bash_profile"


## PATHS ETC ##

# Start by paths etc and doing shell-independent config
if [ -r "${HOME}/.profile" ]; then
    . "${HOME}/.profile"
fi


## INTERACTIVE SESSIONS ##

# Source .bashrc
if [ -r "${HOME}/.bashrc" ]; then
    case $- in
        *i*) . "${HOME}/.bashrc";;
          *) ;;
    esac
fi
