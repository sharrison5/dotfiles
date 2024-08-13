#!/usr/bin/env sh
set -eu

# ignore_git_commit.sh
# Sam Harrison 2024
# MIT License: a full version of the license is included in the LICENSE file.

# Parse args ------------------------------------------------------------------

if [ $# -lt 1 ] || [ $# -gt 1 ]; then
    echo "Usage: ignore_commit_commit.sh <commit>"
    exit 1
fi
commit=$1

# Append to .git-blame-ignore-revs --------------------------------------------

git show \
    --format=format:'%n# %s%n# %an, %as%n%H%n' --quiet "$commit" \
    >> .git-blame-ignore-revs

# -----------------------------------------------------------------------------

exit 0
