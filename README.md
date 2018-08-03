# Yet Another Dotfiles Repository

This is just my way of tracking and syncing dotfiles across machines.
Management is via [Stow](https://www.gnu.org/software/stow/).

--------------------

### Usage

```
git clone --recursive https://github.com/sharrison5/dotfiles.git
cd dotfiles/
stow [--target="$HOME"] <package>
```

Note that some of the packages require slightly different treatment. The
relevant documentation is linked below:
 + [`python/`](python/README.md)

--------------------

### Stow Installation

```
curl -o stow.tar.gz http://ftp.gnu.org/gnu/stow/stow-latest.tar.gz
tar -xzvf stow.tar.gz
cd stow-<version>
./configure --prefix="<dir>"
make
make install
```

--------------------

###### Colophon
Sam Harrison, 2018, MIT License.
A full version of the license is included in the [LICENSE file](LICENSE).

Written in [Markown (CommonMark)](http://commonmark.org/) using the
[live testing tool](http://try.commonmark.org/).
