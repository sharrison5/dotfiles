# MacPorts

This is simply a list of the commands I use most when using
[MacPorts](https://www.macports.org/).
The [MacPorts Guide](https://guide.macports.org/#using.port) is much better!

### Maintenance
sudo port selfupdate
port outdated
sudo port upgrade outdated

### Tidying up
sudo port uninstall --follow-dependencies <blah>
du -sh /opt/local/
sudo port uninstall inactive
sudo port_cutleaves
sudo port reclaim
du -sh /opt/local/

### Leaves
port installed > Installed.txt
port installed active > Active.txt
port echo requested > Requested.txt
sudo port setrequested <blah>

### Installation
port search --name <port*>
port info <port>
sudo port install <port>

### Basics
sudo port install bash bash-completion
sudo port install port_cutleaves

### Command line
sudo port install git
sudo port install htop tree sloccount sshfs stow watch wget

### C++
sudo port install gcc_select clang_select llvm_select
sudo port install gcc7 clang-6.0 llvm-6.0
Select GCC, LLVM, clang
port select --summary
sudo port select --set gcc mp-gcc7
sudo port select --set clang mp-clang-6.0
sudo port select --set llvm mp-llvm-6.0
sudo port install boost tclap hdf5 armadillo

### Plotting etc
sudo port install ffmpeg gnuplot

### Random
sudo port install gti sl agree

---

###### Colophon
Sam Harrison, 2018, MIT License.
A full version of the license is included in the LICENSE file.

Written in [Markown (CommonMark)](http://commonmark.org/)
using [Dillinger](http://dillinger.io).
