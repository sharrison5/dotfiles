#!/usr/bin/env bash

# .macports/save_requested.sh
# Sam Harrison 2018
# MIT License: a full version of the license is included in the LICENSE file.

date > "${HOME}/.macports/requested.txt"
port echo requested | cut -d ' ' -f 1 | uniq >> "${HOME}/.macports/requested.txt"
