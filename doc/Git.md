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

I tend to use
[Git Flow](https://nvie.com/posts/a-successful-git-branching-model/), though
YMMV. One of the key features which I typically use even if not sticking to the
full-fat version is to use `git merge --no-ff` to preserve branch information.
Of course, you could also set `git config --global merge.ff only`.

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
git clone [--recursive] <git@git.com:me/project.git>
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
Save it to e.g. `~/.ssh/id_rsa_<description>`. Copy the **public** key
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
git diff [--cached] [<file>]
git add [-p|--patch] [-N|--intent-to-add] [<file>]
git status [-s|--short]
git commit [-m "<Commit message>"]
git log [--graph]
```

--------------------

### Branching

```
# List branches
git branch [-v|--verbose]

# Switch (usually want to stash first)
git checkout <branch>

# Create new branch
git branch <branch> [<start-point>]
# Create and switch
git checkout -b <branch> [<start-point>]

# Merge into current branch
git merge [--no-ff] [--no-commit] <branch>

# Delete
git branch [-d|--delete] <branch>
```

--------------------

### Stashing

```
# Stash changes
git stash [-p|--patch]

# Show stashes
git stash list

# Contents of stash
git stash show [-p|--patch] <stash@{0}>

# Restore a stash
git stash pop <stash@{0}>
```

--------------------

###### Colophon
Sam Harrison, 2018, MIT License.
A full version of the license is included in the LICENSE file.

Written in [Markown (CommonMark)](http://commonmark.org/) using the
[live testing tool](http://try.commonmark.org/).
