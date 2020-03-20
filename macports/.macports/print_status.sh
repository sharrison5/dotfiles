#!/usr/bin/env sh

# .macports/print_status.sh
# Sam Harrison 2018
# MIT License: a full version of the license is included in the LICENSE file.

echo "MacPorts"
echo "========"
port version
echo

echo "Requested ports"
echo "==============="
port echo requested and active
echo

port select --summary
