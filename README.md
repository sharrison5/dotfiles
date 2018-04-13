http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html


https://www.gnu.org/software/stow/

    curl -o stow.tar.gz http://ftp.gnu.org/gnu/stow/stow-latest.tar.gz
    tar -xzvf stow.tar.gz
    cd stow-<version>
    ./configure --prefix="<dir>"
    make
    make install
