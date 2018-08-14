# Git

This is a simple overview of the [Git](https://git-scm.com/) commands /
workflow I tend to use. See below for a list of more comprehensive, and
better, references.

##### Useful links
The [Git Reference Manual](https://git-scm.com/docs) and the
[Pro Git book](https://www.git-scm.com/book/en/v2) are the canonical
references, though they can be a little
[opaque](https://git-man-page-generator.lokaltog.net).
There are more 'Cheat Sheets' than you can shake a stick at, but I
particularly like [this one](https://sentheon.com/blog/git-cheat-sheet.html)
(see also [here](https://gist.github.com/eashish93/3eca6a90fef1ea6e586b7ec211ff72a5)
and [here](https://services.github.com/on-demand/downloads/github-git-cheat-sheet.pdf)).
Finally, '[Git from the bottom up](http://newartisans.com/2008/04/git-from-the-bottom-up/)'
is an excellent overview of Git's internals, or if you just want something
completely different try [here](http://stevelosh.com/blog/2013/04/git-koans/).

##### Syntax
```
command [--option_A|--or_B] --argument <value_to_be_specified>
```

--------------------

### Config

The `.gitconfig` file contains the key options I use, and these should be
explained in the comments. The Git Book also has a good
[section on config](https://www.git-scm.com/book/en/v2/Customizing-Git-Git-Configuration).

Use `git config --list --show-origin` to see what options are in effect, and,
perhaps more importantly, whether they reflect `local` (i.e. specific to the
current repository) or `global` options. In general, use
`git config [--global] <key> <value>` to set options. Git is almost
limitlessly [customisable](https://git-scm.com/docs/git-config), so there
is a lot more to play with!

I also have global [`.gitignore`](https://git-scm.com/docs/gitignore)
and [`.gitattributes`](https://www.git-scm.com/docs/gitattributes) files.
Some of these rules should be included in specific repositories too, but
they serve as useful templates. See
[github.com/github/gitignore](https://github.com/github/gitignore) and
[github.com/alexkaratarakis/gitattributes](https://github.com/alexkaratarakis/gitattributes)
for useful collections of these rules.

--------------------

### General workflow

I tend to use [Git Flow](https://nvie.com/posts/a-successful-git-branching-model/)
for larger projects, though YMMV. One of the key features which I typically use
even if not sticking to the full-fat version is to use `git merge --no-ff` to
preserve branch information.  Of course, you could also set
`git config --global merge.ff only`.

Otherwise, good commit messages help! See
[this article](https://chris.beams.io/posts/git-commit/) for an overview,
but the key take homes are to write short (\<50 character) subject lines in
the imperative (i.e. *This commit will \<subject line\>*), and to use the
body to explain *what* and *why*.

--------------------

### Getting started

```
cd <project/>
git init
git remote add origin <git@git.com:me/project.git>
```
or
```
git clone [--recurse-submodules] <git@git.com:me/project.git>
cd <project/>
```
Do some commits, and then:
```
git push [-u|--set-upstream] origin [<branch>|--all]
```

##### SSH Keys
That should have us up and running, but we typically want to add SSH keys to
streamline the process of interacting with the server. Generate the key
using e.g.:
```
ssh-keygen -t rsa -C "<example@email.com> <description>" -b 4096
```
For the `<description>`, it is useful to know both the origin and destination
of the connection. As `~/.ssh/authorized_keys` contains the public keys, the
description should uniquely identify the connecting machine. Similarly, it
seems better-safe-than-sorry to include the destination for identifying the
keys on the origin machine. Therefore `<origin> <destination>` seems
sensible, where e.g. the hostnames could be used.

Save the keys to e.g. `~/.ssh/id_rsa_<destination>`. Copy the **public** key
(`.pub`) to the server, and then modify `~/.ssh/config` as follows:
```
# Git server
Host git.com
PubkeyAuthentication yes
IdentityFile ~/.ssh/id_rsa_<description>
```
Finally, it may be necessary to change the remote to use SSH if it is not
already configured to do so. Do this using:
```
git remote set-url origin <ssh://git@git.com:me/project.git>
```

--------------------

### Workhorse local commands

```
git status [-s|--short]
git diff [--cached] [--word-diff] [-- <files>]
git add [-p|--patch] [-N|--intent-to-add] [-- <files>]
git commit [-m "<Commit message>"]
git log [--graph]
```

--------------------

### Local branching

```
# List branches
git branch [-v[v]|--verbose]

# Switch (may want to stash first)
git checkout <branch>

# Create new branch
git branch <branch> [<start-point>]
# Create and switch
git checkout -b <branch> [<start-point>]

# Merge into current branch
git merge [--no-ff] [--no-commit] <branch>

# Delete
git branch -d|--delete <branch>
```

--------------------

### Stashing

```
# Stash changes
git stash [-p|--patch] [--keep-index] [-- <files>]

# Show stashes
git stash list

# Contents of stash
git stash show [-p|--patch] <stash@{0}>

# Restore a stash
git stash pop <stash@{0}>
```

--------------------

### Working with remote repositories

##### Setting up remotes
`<remote>` is the local name for the remote repository and `<url>` can
be HTTP, SSH, etc.

```
# List/inspect remotes
git remote [-v|--verbose]
git remote show <remote>

# Add/modify remotes
git remote add <remote> <url>
git remote set-url <remote> <url>
```

##### Basic workflow
```
# Get changes
git fetch [--verbose] [<remote>|--all]

# Look at branches
git branch [-a|--all] [-r|--remotes] [-v[v]|--verbose]

# Merge changes to this branch if fast-forwardable
git merge --ff-only @{upstream}
# If this fails, will need to do a proper merge or rebase
git merge @{upstream}
git rebase [--rebase-merges] @{upstream}

# Push changes to the remote
git push [--follow-tags] <remote> [<branch>|--all]
```

Note that `--rebase-merges` may need replacing with `--preserve-merges` for
older verions of Git.

##### Branch management
```
# Creating branches from remote versions
# Note that `--track` is the default and can be omitted
git branch [--track] <branch> <remote/start-point>
# Also, Git conveniently makes the following two commands equivalent if
# <branch> does not exist locally but does on one remote
git checkout <branch>
git checkout -b <branch> --track <remote/branch>

# Adding tracking to extant local branches
git push --set-upstream <remote> [<branch>|--all]
git branch --set-upstream-to=<upstream> [<branch>]
```

##### Housekeeping
```
git remote remove <remote>

# Delete remote branch
git push <remote> --delete <branch>

# Remove local copies of e.g. branches that have been deleted from the remote
git remote prune [--dry-run] <remote>
```

--------------------

### Submodules

The simplest job is probably just to get a repository that contains
submodules:
```
git clone --recurse-submodules [-j|--jobs <n>] <repository>
```
Note that for older versions of git, `--recurse-submodules` needs to be
replaced with `--recursive`.

Internally, git stores submodules as a URL, a local path, and a specific
commit. However, this information is typically stored in both `.gitmodules`
and `.git/config`. The former is the copy of record that is included within
the repository, whereas the latter contains any local changes (which allows
you to specify different URLs, ignore some submodules temporarily etc). The
`init` and `sync` commands deal with moving information between the two.

The rest of the commands deal with managing submodules within a
project, but don't deal with how to make changes to the submodules too.
```
# Update submodules (i.e. checkout specified commit)
# `--init` can be used instead of `git submodule init`
# `--recursive` means apply to submodules of submodules too
git submodule update [--init] [--recursive] [-j|--jobs <n>]

# Add to project, with optional location (or if already cloned locally)
git submodule add <repository> [<path/to/repository>]

# See changes
git submodule status [--recursive]
git diff [--submodule[=<short|log|diff>]]

# Update URLs
git submodule sync [--recursive]

# Apply a command to each submodule (e.g. `<command>="git fetch"`)
git submodule foreach [--recursive] <command>
```

To update a submodule to a different commit, it's probably simplest to just
`cd` into the submodule and manually checkout the required commit rather than
automating everything.

--------------------

### Fixing things!

##### Manipulating uncommited changes
Both dealing with local changes to files and modifying changes rely heavily on
`checkout` and `reset`. The [Atlassian guide](https://www.atlassian.com/git/tutorials/resetting-checking-out-and-reverting)
covers these well.

In short, when given a file `reset` will modify the index whereas `checkout`
will modify the working directory. However, when working at the commit-level,
`reset` will discard changes or old commits whereas `checkout` will simply
switch between them.

```
# Reset index (i.e. opposite of git add)
git reset [-p|--patch] [-- <files>]

# Overwrite local changes with index
git checkout [-p|--patch] -- <files>

# Overwrite local changes (and index) with previous commit
# HEAD can be replaced by any commit
git checkout [-p|--patch] HEAD -- <files>
```

##### Modifying commit history
Be very careful! If changes have been pushed to a remote (or, worse, if others
have fetched them) then modifying the commit history is a nightmare.  In that
case, we probbaly want to `revert`, which adds new commits that simply undo the
precious changes:
```
git revert [-n|--no-commit] <commits>
```

For unpublished changes, we have more freedom. Git makes it particularly easy
to tweak the last commit:
```
# Redo the last commit, including any newly staged changes
git commit --amend [--no-edit] [--reset-author]
```

If we want to more drastically rework things we can use `reset`. This moves the
branch head back to a specified commit (thereby rendering the future commits
inaccessible).
```
git reset [--soft] HEAD~1
```
This keeps the files as they are locally, so essentially undos any commits
without losing the changes to the files. The `--soft` flag even preserves
changes to the index, so essentially drops us to right before running `git
commit`.

Finally, we may want to alter a commit further back in time, but keep the main
thrust of the development work. An interactive rebase allows us to do just
this: tweak past commits but keep the overall sequence (if we want: we can also
reorder or delete commits).
```
# Specify parent of commit to edit (this edits past 3 commits)
git rebase -i|--interactive HEAD~3

# Choose commits to reword/edit/etc from given list in editor

# Make and add changes to files, if any required

git commit --amend
git rebase --continue
```
See the [section in the Git Book](https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History)
or the [GitHub Blog](https://blog.github.com/2015-06-08-how-to-undo-almost-anything-with-git/)
for a good guide to these processes.

##### Resolving conflicts
Sometimes, you just have an ["Oh shit, git!"](http://ohshitgit.com/) moment...
Typically, this is when a stash/merge/rebase fails due to some conflicts, but
there are plenty of other pitfalls.

The general system for resolving conflicts is:
```
git status

# Then either:
# 1) Manually modify files and add to mark as resolved
edit <files>
git add -- <files>
# 2) Or if we just want to keep one of the versions
git checkout --ours|--theirs -- <files>

# And crack on
git merge|rebase --continue
# Note that `git commit` will also work in the merge case
```
Note that if things really go south there is the option to start again with
`git merge|rebase --abort`.

The procedure for sorting out a failed `stash pop` is similar:
```
git stash pop [stash@{0}]

# Resolve conflicts (as above)

# And then reset the index (i.e. undo the git add)
git reset [-- <files>]

# Git does not remove the old stash if there are errors applying, so need
# to do it manually
git stash drop [stash@{0}]
```

Finally, applying two stashes at once can be tricky, as Git doesn't let you
apply stashes with a dirty working directory. A solution is:
```
# Add all local changes to index
git add -u|--update

git stash pop [stash@{0}]

# And then remove files from the index
git reset
```

--------------------

###### Colophon
Sam Harrison, 2018, MIT License.
A full version of the license is included in the [LICENSE file](../LICENSE).

Written in [Markown (CommonMark)](http://commonmark.org/) using the
[live testing tool](http://try.commonmark.org/).
