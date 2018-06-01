# .bash_aliases
# Sam Harrison 2018
# MIT License: a full version of the license is included in the LICENSE file.


#echo ".bash_aliases"


## LS ##

#alias ls='ls --color=auto'
#alias ls='ls -G'
alias ll='ls -lh'


## RSYNC ##

alias rsync='rsync --verbose --human-readable --progress --stats'


## GIT ##

# Status
alias gs="git status"
alias gss="git status -s"
alias gssc="clear; echo "Status:"; gss"

# Diff
alias gd="git diff"
alias gdc="git diff --cached"

# Logs
# Short log: hash | date in blue | how long ago | newline | subject | newline
alias gl='git log --pretty=format:"%h %Cblue%ad%Creset (%ar) %n%s %n" --date=short'
# Very short log: hash | date | subject truncated to fit one line
alias gls='git log --pretty=format:"%h %Cblue%ad%Creset %<(60,trunc)%s" --date=short'

# Merge upstream branch
alias gmu="git merge --ff-only @{u}"
