# neovim-config

## Pre-requisites
This needs 0.9.x version of neovim

## Installation
- Install Packer neovim
https://github.com/wbthomason/packer.nvim

copy the nvim directory to ~/.config/nvim/ directory

- navigate to ~/.config/nvim/lua/zihehuang/packer.lua
- run `:so`
- run `:PackerSync`


To activate github copilot
- Install Nodejs per https://github.com/github/copilot.vim#getting-started
- run `:Copilot auth`

To install LSP
- run `:LspInstall`

For Telescope livegrep to work:
- install ripgrep https://github.com/BurntSushi/ripgrep#installation

For System Clipboard to work:
- Try install xclip or xsel
