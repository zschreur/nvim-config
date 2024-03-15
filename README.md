# Setup
1. Clone this repo to: `~/.config/nvim`
2. Open `~/.config/nvim/lua/user/packer.lua` in neovim
3. With `packer.lua` open, run `:so` neovim command.
4. Run `:PackerSync` and verify everything is installed.
5. In order for Telescope to work we need to install ripgrep:
```
brew install ripgrep
```
6. Install nerd fonts and set font in terminal
```
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
```
7. Run `:checkhealth` and verify that there are no errors.
