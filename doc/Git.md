# Git

This is a simple overview of the [Git](https://git-scm.com/) commands /
workflow I tend to use. See below for a list of more comprehensive, and
better, references.

##### Useful links

The [Git Reference Manual](https://git-scm.com/docs) and the
[Pro Git book](https://www.git-scm.com/book/en/v2) are the canonical
references, though they can be a little
[opaque](https://git-man-page-generator.lokaltog.net).

http://nvie.com/posts/a-successful-git-branching-model/
https://chris.beams.io/posts/git-commit/

https://services.github.com/on-demand/downloads/github-git-cheat-sheet.pdf
https://sentheon.com/blog/git-cheat-sheet.html
https://gist.github.com/eashish93/3eca6a90fef1ea6e586b7ec211ff72a5
Git from the ground up

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

###### Colophon
Sam Harrison, 2018, MIT License.
A full version of the license is included in the LICENSE file.

Written in [Markown (CommonMark)](http://commonmark.org/) using the
[live testing tool](http://try.commonmark.org/).
