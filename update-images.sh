#!/usr/bin/env bash
rm -rf .tmp
RANGE="p"
if test -n "$1"; then
  RANGE="$1,$2p;$(expr $2 + 1)q"
fi
ls -1 themes/*.toml | xargs -n 1 basename -s .toml | sort | sed -n "$RANGE" | xargs -n 1 -P ${PARALLEL:-10} bash vhs.sh
