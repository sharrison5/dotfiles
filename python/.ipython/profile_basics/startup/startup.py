# startup.py
# Sam Harrison 2018
# MIT License: a full version of the license is included in the LICENSE file.

# Designed as a lightweight alternative to pylab that doesn't pollute
# the global namespace.
# https://ipython.readthedocs.io/en/stable/config/intro.html#profiles
# https://stackoverflow.com/a/20528503

import math
import numpy
import scipy, scipy.stats

# Best to invoke ipython with the `--matplotlib` flag too
# https://ipython.readthedocs.io/en/stable/interactive/reference.html#matplotlib-support
import matplotlib, matplotlib.pyplot
mpl = matplotlib
plt = matplotlib.pyplot
