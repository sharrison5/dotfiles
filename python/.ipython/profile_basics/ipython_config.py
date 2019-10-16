# ipython_config.py
# Sam Harrison 2019
# MIT License: a full version of the license is included in the LICENSE file.

# https://ipython.readthedocs.io/en/stable/development/config.html

# Try to reload modules if changed - gives more interactive debugging
# https://ipython.readthedocs.io/en/stable/config/extensions/autoreload.html
c.InteractiveShellApp.extensions = ['autoreload']
c.InteractiveShellApp.exec_lines = ['%autoreload 2']
