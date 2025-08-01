# [jjui themes](https://idursun.github.io/jjui/Themes.html) from [base16](https://nico-i.github.io/scheme-viewer/base16/) and [base24](https://nico-i.github.io/scheme-viewer/base24/) color schemes.

[Color scheme Gallery](https://tinted-theming.github.io/tinted-gallery/)

## Usage

Download any of the `.toml` files from `./themes/` and place it
in your `$HOME/.config/jjui/themes/` directory.

Then edit `$HOME/.config/jjui/config.toml` to set your theme.

For example, to use `./themes/base24-solarized-dark-higher-contrast.toml`:


```toml
[ui]
theme = "base24-solarized-dark-higher-contrast"
```


## Adding all themes.

Download this repo .zip file.

```shell
# move all themes to your jjui config
mv ./themes/*.toml $HOME/.config/jjui/themes/

# Add each theme as a commented line under [ui]
echo '[ui]' >> $HOME/.config/jjui/config.toml
ls -1 $HOME/.config/jjui/themes/*.toml | xargs -n 1 basename | sed -e 's/.toml//' | sed -E 's/(.*)/# theme = "\1"/' >> $HOME/.config/jjui/config.toml

# Uncomment the theme you want to use.
vi $HOME/.config/jjui/config.toml
```