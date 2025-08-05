#!/usr/bin/env bash
rm -rf .tmp
ls -1 themes/*.toml | xargs -n 1 basename -s .toml | xargs -n 1 -P ${PARALLEL:-10} bash vhs.sh
sed -n -e '/## Themes/,$!p' -i README.md
echo -e "## Themes\n\n" >>README.md
cat .tmp/*.md >>README.md
rm -rf .tmp
