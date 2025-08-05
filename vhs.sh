#!/usr/bin/env bash
set -e -o pipefail
ROOT=$PWD
mkdir -p $ROOT/.tmp/$1/jjui/themes $ROOT/images/
ln -sf $ROOT/themes/$1.toml $ROOT/.tmp/$1/jjui/themes/$1.toml
echo -e "[ui]\ntheme='$1'" >$ROOT/.tmp/$1/jjui/config.toml
(
  cd $ROOT/.tmp/$1
  JJUI_REPO="${2:-${JJUI_REPO:-$ROOT}}"
  cp $ROOT/vhs.tape vhs.tape
  echo >source.tape
  if grep '# Scheme variant: light' $ROOT/themes/$1.toml >&2 >/dev/null; then
    echo 'Set Theme "zenwritten_light"' >>source.tape
  else
    echo 'Set Theme "zenwritten_dark"' >>source.tape
  fi
  cat <<EOF >>source.tape
Env JJUI_CONF_DIR "${PWD}"
Env JJUI_REPO "${JJUI_REPO}"
EOF
  vhs -q vhs.tape
  mv "$ROOT/.tmp/$1/jjui.png" $ROOT/images/$1.png
  echo "$ROOT/images/$1.png"
  tq='```'
  cat <<EOF >$ROOT/.tmp/$1.md
### [${1}](./themes/${1}.toml)

${tq}toml
[ui]
theme = "${1}"
${tq}

<p align="center">
  <img title="${1}" alt="${1}" src="images/${1}.png" />
</p>

EOF
)
