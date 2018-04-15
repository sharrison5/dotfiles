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
YMMV. One of the key features which I tend to use even if not sticking to the
full-fat version is to use `git merge --no-ff` to preserve branch information.
Of course, you could also set `git config --global merge.ff only`.

Otherwise, good commit messages help! See
[this article](https://chris.beams.io/posts/git-commit/) for an overview,
but the key take homes are to write short (\<50 character) subject lines in
the imperative (i.e. *This commit will \<subject line\>*), and to use the
body to explain *what* and *why*.

--------------------

### Geting started

```
cd <project/>
git init
git remote add origin <git@git.com:me/project.git>
```
or
```
git clone <git@git.com:me/project.git>
cd <project/>
```
Do some commits, and then:
```
git push [-u|--set-upstream] origin [<branch>|--all]
```

###### SSH Keys
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

--------------------

###### Colophon
Sam Harrison, 2018, MIT License.
A full version of the license is included in the LICENSE file.

Written in [Markown (CommonMark)](http://commonmark.org/) using the
[live testing tool](http://try.commonmark.org/).
