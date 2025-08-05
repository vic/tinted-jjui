#!/usr/bin/env bash
set -e -o pipefail
ROOT=$PWD
mkdir -p $ROOT/.tmp/$1/jjui/themes
ln -sf $ROOT/themes/$1.toml $ROOT/.tmp/$1/jjui/themes/$1.toml
echo -e "[ui]\ntheme='$1'" >$ROOT/.tmp/$1/jjui/config.toml
(
  cd $ROOT/.tmp/$1
  vhs -q $ROOT/vhs.tape
  url="$PWD/jjui.gif"
  if test -n "${CI:-}"; then
    url="$(vhs publish -q jjui.gif)"
  fi
  echo "$url"
  tq='```'
  cat <<EOF >$ROOT/.tmp/$1.md
### [${1}](./themes/${1}.toml)

${tq}toml
[ui]
theme = "${1}"
${tq}

<p align="center">
  <img title="${1}" alt="${1}" src="${url}" />
</p>

EOF
)
