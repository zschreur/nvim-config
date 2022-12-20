local opts = { silent = true }

-- Modes
--   Modes = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- Press jk fast to enter
vim.keymap.set("i", "jk", "<ESC>", opts)

-- Keeps cursor in middle of page while doing page jumping
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)

-- Search terms stay in the middle
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'nzzzv')

-- next greatest remap ever : asbjornHaland
-- copy to system clipboard with leader y
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set('n', 'Q', '<nop>')
