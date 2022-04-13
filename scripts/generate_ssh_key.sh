#!/usr/bin/env sh
set -eu

# generate_ssh_key.sh
# Sam Harrison 2020
# MIT License: a full version of the license is included in the LICENSE file.

# See `doc/Git.md` for further information

# Parse args ------------------------------------------------------------------

if [ $# -lt 3 ] || [ $# -gt 3 ]; then
    echo "Usage: generate_ssh_key.sh <local-name> <remote-name> <email>"
    exit 1
fi
local_name=$1
remote_name=$2
email=$3

# ssh-keygen ------------------------------------------------------------------

method=ed25519
#method=rsa-sha2-512

filename="${HOME}/.ssh/id_${method}_${local_name}_${remote_name}"
comment="${local_name} ${remote_name} ${email} $(date -u +"%Y-%m-%dT%H:%M:%SZ")"
echo "Key file: $filename"
echo "Key comment: $comment"

# See e.g.
# https://security.stackexchange.com/a/144044
# https://stribika.github.io/2015/01/04/secure-secure-shell.html
ssh-keygen \
    -t "$method" -a 100 \
    -f "$filename" -C "$comment"

# -----------------------------------------------------------------------------

exit 0
