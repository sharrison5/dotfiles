# startup.py
# Sam Harrison 2018
# MIT License: a full version of the license is included in the LICENSE file.

# Designed as a lightweight alternative to pylab that doesn't pollute
# the global namespace.
# https://ipython.readthedocs.io/en/stable/config/intro.html#profiles
# https://stackoverflow.com/a/20528503

import warnings

import math
import random
#import statistics

import numpy
np = numpy
try:
    import scipy, scipy.stats
except ImportError:
    warnings.warn("Could not import scipy.")

# Best to invoke ipython with the `--matplotlib` flag too
# https://ipython.readthedocs.io/en/stable/interactive/reference.html#matplotlib-support
import matplotlib, matplotlib.pyplot
mpl = matplotlib
plt = matplotlib.pyplot

mpl.rcParams['image.aspect'] = 'auto'
