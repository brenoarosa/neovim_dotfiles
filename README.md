# Neovim config files

### Install

Clone into [neovim config path](https://stackoverflow.com/a/41419168/6723594).  
Example (MacOS): `git clone git@github.com:brenoarosa/neovim_dotfiles.git ~/.config/nvim`

### Plugins

Using [Vim Plug](https://github.com/junegunn/vim-plug)  
Upgrade plugin manager: `:PlugUpgrade`  
Upgrade plugins: `:PlugUpdate`

### Fonts

Dependes on a "patched" font. One that supports <https://github.com/kyazdani42/nvim-web-devicons>.  
Also depends on powerline font.

Currently iTerm2 font config:  
Monaco 13 + Non-ASCII: mononoki NF 14

Currently Gnome Terminal font config:  
Cousine Nerd Font 11 (legible at 12 but also good at 11)

Install powerline fonts:
- Linux: [fonts-powerline](https://packages.debian.org/sid/fonts-powerline)
- MacOS: prefer brew when installing fonts
