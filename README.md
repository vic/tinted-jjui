# tinted-jjui -- jjui themes generated from [base16](https://nico-i.github.io/scheme-viewer/base16/) and [base24](https://nico-i.github.io/scheme-viewer/base24/) color schemes.


## Usage

Download any of the `.toml` files from `./colors/` and place it
in your `$HOME/.config/jjui/themes/` directory.

Then edit `$HOME/.config/jjui/config.toml` to set your theme.

For example, to use `./colors/base24-rebecca.toml`:


```toml
[ui]
theme = "base24-rebecca"
```

This will set jjui colors to use [vic](https://x.com/oeiuwq)'s [rebecca-purple](https://github.com/vic/rebecca-theme)


## Adding all themes.

Download this repo .zip file.

```shell
# move all themes to your jjui config
mv ./colors/*.toml $HOME/.config/jjui/themes/

# Add each theme as a commented line under [ui]
echo '[ui]' >> $HOME/.config/jjui/config.toml
ls -1 $HOME/.config/jjui/themes/*.toml | xargs -n 1 basename | sed -e 's/.toml//' | sed -E 's/(.*)/# theme = "\1"/' >> $HOME/.config/jjui/config.toml

# Uncomment the theme you want to use.
vi $HOME/.config/jjui/config.toml
```