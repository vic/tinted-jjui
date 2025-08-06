#!/usr/bin/env bash
ROOT=$PWD
mkdir -p $ROOT/.tmp
for N in $(ls -1 $ROOT/images/*.png | xargs -n 1 basename -s .png); do
  tq='```'
  cat <<EOF >$ROOT/.tmp/$N.md
### [${1}](./themes/${N}.toml)

${tq}toml
[ui]
theme = "${N}"
${tq}

<p align="center">
  <img title="${N}" alt="${N}" src="images/${N}.png" />
</p>

EOF
done

sed -n -e '/## Themes/,$!p' -i README.md
echo -e "## Themes\n\n" >>README.md
cat .tmp/*.md >>README.md
rm -rf .tmp
