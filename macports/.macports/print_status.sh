#!/usr/bin/env bash

# .macports/list_requested.sh
# Sam Harrison 2018
# MIT License: a full version of the license is included in the LICENSE file.

echo "Requested ports"
echo "==============="
port echo requested and active
echo
port select --summary
