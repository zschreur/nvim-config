-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
   -- Packer can manage itself
   use 'wbthomason/packer.nvim'

   -- color schemes
   use 'EdenEast/nightfox.nvim'

   -- ui layout
   use 'vim-airline/vim-airline'
   use 'vim-airline/vim-airline-themes'

   -- git plugins
   use 'tpope/vim-fugitive'
   use 'tpope/vim-rhubarb'

   -- lsp
   use 'neovim/nvim-lspconfig'
end)
