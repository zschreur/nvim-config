local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local currentColor = "tokyonight"
local isTransparent = true

function ColorMyPencils(color)
    currentColor = color

    vim.cmd.colorscheme(currentColor)

    if isTransparent then
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
end

function ToggleTransparency()
    isTransparent = not isTransparent
    ColorMyPencils(currentColor)
end

local plugins = {
    {
        "folke/tokyonight.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- load the colorscheme here
            ColorMyPencils(currentColor)
        end,
    },
    { "EdenEast/nightfox.nvim", lazy = true },
    { "chriskempson/base16-vim", lazy = true },

    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "BurntSushi/ripgrep",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "cmake -S . -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
            },
        },
    },
    "nvim-lualine/lualine.nvim",
    "mbbill/undotree",
    "tpope/vim-fugitive",
    "ryanoasis/vim-devicons",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",

    "hrsh7th/nvim-cmp", -- completion plugin
    "hrsh7th/cmp-buffer", -- buffer completions
    "hrsh7th/cmp-path", -- path completions
    "hrsh7th/cmp-cmdline", -- snippet completions
    "hrsh7th/cmp-nvim-lsp", -- lsp completions
    "hrsh7th/cmp-nvim-lua", -- lua completions

    -- lsp
    "neovim/nvim-lspconfig",

    "ckipp01/stylua-nvim",

    "zschreur/telescope-jj.nvim",
    "avm99963/vim-jjdescription",

    -- just support
    "NoahTheDuke/vim-just",
    "IndianBoy42/tree-sitter-just",
}

local opts = {}

require("lazy").setup(plugins, opts)
require("config.cmp")
require("config.fugitive")
require("config.lsp")
require("config.lualine")
require("config.tabline")
require("config.telescope")
require("config.treesitter")
require("config.undotree")
