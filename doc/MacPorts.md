# MacPorts

This is simply a list of the commands I use most when using
[MacPorts](https://www.macports.org/).
The [MacPorts Guide](https://guide.macports.org/#using.port) is much better!

### Maintenance
```
sudo port selfupdate
port outdated
sudo port upgrade outdated
```

### Installation
```
port search --name '<port>*'
port info <port>; port variants <port>
sudo port install <port>
port contents <port>

# For setting which variant to use / overriding system defaults
sudo port install <port_select>
port select --summary
sudo port select --set <port> <variant>
```

### Management
```
~/.macports/print_status.sh
```
It can be useful to mark common ports as requested, so that they do not
get cleaned up and then reinstalled repeatedly. To do this, use:
```
port echo leaves
sudo port setrequested <port>
```

### Tidying up
```
sudo port uninstall --follow-dependencies <blah>
```
```
du -sh /opt/local/
sudo port reclaim
du -sh /opt/local/
```

### Migration
After upgrading [macOS](https://www.apple.com/macos) it is necessary to
essentially reinstall MacPorts.
See the [MacPorts Wiki](https://trac.macports.org/wiki/Migration) for
more details.

--------------------

###### Colophon
Sam Harrison, 2018, MIT License.
A full version of the license is included in the [LICENSE file](../LICENSE).

Written in [Markown (CommonMark)](http://commonmark.org/) using the
[live testing tool](http://try.commonmark.org/).
