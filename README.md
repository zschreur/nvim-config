# Setup
1. Install Packer
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
2. Clone this repo to: `~/.config/nvim`
3. Open `~/.config/nvim/lua/user/packer.lua` in neovim
4. With `packer.lua` open, run `:so` neovim command.
5. Run `:PackerSync` and verify everything is installed.
6. In order for Telescope to work we need to install ripgrep:
```
brew install ripgrep
```
7. Install nerd fonts and set font in terminal
```
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
```
8. Run `:checkhealth` and verify that there are no errors.