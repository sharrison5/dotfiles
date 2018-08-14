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


## LS ##

#alias ls='ls --color=auto'
#alias ls='ls -G'
alias la='ls -a'
alias ll='ls -lah'


## RSYNC ##

alias rsync='rsync --verbose --human-readable --progress --stats'


## PYTHON ##

alias ipy='ipython'
alias ipylab='ipython --profile=basics --matplotlib'


## GIT ##

# Status
alias gs='git status'
alias gss='git status --short'
alias gssc='clear; echo "Status:"; git status --short'

# Diff
alias gd='git diff'
alias gdc='git diff --cached'

# Add
alias ga='git add'
alias gap='git add --patch'

# Commit
alias gc='git commit'

# Logs
alias gl='git log'
# Very short log: hash | date | subject truncated to fit one line
alias gls='git log --pretty=format:"%h %Cgreen%ad%Creset %<(60,trunc)%s" --date=short'
# And a full-fat version
alias glf='git log --graph --format=fuller'

# Branching
alias gb='git branch'
alias gba='git branch --all --verbose --verbose'

# Remotes
alias gr='git remote'
alias grv='git remote --verbose'
alias grs='git remote show'

# Fetching
alias gf='git fetch --verbose'
# Merge upstream branch
alias gmu='git merge --ff-only @{upstream}'

# Pushing
alias gp='git push --verbose'
alias gpt='git push --verbose --follow-tags'
