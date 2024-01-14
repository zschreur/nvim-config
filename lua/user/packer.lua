-- This file can be loaded by calling `lua require("plugins")` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- Use a protected call so we don"t error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
   return
end

-- Have packer use a popup window
packer.init {
   display = {
      open_fn = function()
         return require "packer.util".float { border = "rounded" }
      end,
   },
}

return packer.startup(function(use)
   -- Packer can manage itself
   use "wbthomason/packer.nvim"

   use {
      "nvim-telescope/telescope.nvim", tag = "0.1.5",
      requires = { { "nvim-lua/plenary.nvim" } }
   }

   use { "rose-pine/neovim", as = "rose-pine" }
   use "folke/tokyonight.nvim"
   use "EdenEast/nightfox.nvim"
   use "sainnhe/edge"
   use { "catppuccin/nvim", as = "catppuccin" }

   use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

   use "nvim-lualine/lualine.nvim"

   use "mbbill/undotree"
   use "tpope/vim-fugitive"

   use "editorconfig/editorconfig-vim"

   -- vim nerdfont
   use "ryanoasis/vim-devicons"

   -- snippets
   use "saadparwaiz1/cmp_luasnip"
   use "L3MON4D3/LuaSnip" -- snippet engine
   use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

   -- cmp
   use "hrsh7th/nvim-cmp" -- completion plugin
   use "hrsh7th/cmp-buffer" -- buffer completions
   use "hrsh7th/cmp-path" -- path completions
   use "hrsh7th/cmp-cmdline" -- nippet completions
   use "hrsh7th/cmp-nvim-lsp" -- lsp completions
   use "hrsh7th/cmp-nvim-lua" -- lua completions

   -- lsp
   use "neovim/nvim-lspconfig"

   -- tmux + vim navigation
   -- use 'christoomey/vim-tmux-navigator'

   -- CoPilot
   use "github/copilot.vim"
end)
