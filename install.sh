#!/bin/sh
# Install crdir and its man page. Safe to re-run.
set -eu
HERE=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
run() {
  if [ "$(id -u)" -eq 0 ]; then
    "$@"
  else
    sudo "$@"
  fi
}
run install -m 0755 "$HERE/bin/crdir" /usr/local/bin/crdir
run mkdir -p /usr/local/share/man/man1
run install -m 0644 "$HERE/man/crdir.1" /usr/local/share/man/man1/crdir.1
echo "installed /usr/local/bin/crdir"
echo "installed /usr/local/share/man/man1/crdir.1"
