# Setup (MacOS)
Clone this repo to: `~/.config/nvim`

## Install luarocks
This is a dependency of lazy.nvim and it requires lua 5.1
### Install lua 5.1 locally
```
# Download lua tarball
curl -R -O https://www.lua.org/ftp/lua-5.1.5.tar.gz

# Extract the tarball
tar -xzf lua-5.1.5.tar.gz

# Run make
cd ./lua-5.1.5
make macosx test
sudo make install

# Check version
lua -v
```

### Install luarocks locally
```
# Download tarball
curl -R -O https://luarocks.github.io/luarocks/releases/luarocks-3.11.1.tar.gz

# Extract
tar -xzf luarocks-3.11.1.tar.gz

# Run make
make
sudo make install

# Check version
luarocks --version
```

## Check Health
Run `:checkhealth` and check for any errors

## Optional
### Nerd fonts
```
# Install nerd fonts
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
```
