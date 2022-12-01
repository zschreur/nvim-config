local colorscheme = 'material'

vim.g.material_theme_style = 'default'
vim.g.material_terminal_italics = 1

local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_ok then
   vim.notify('colorscheme ' .. colorscheme .. ' not found!')
   return
end

vim.opt.background = 'dark'
