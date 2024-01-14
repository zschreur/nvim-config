local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

local plugins = {}
local plugins = {}

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
-- TODO: Load when plugins is set up
-- require("lazy").setup(plugins, opts)
