local options = {
    -- :help options
    cmdheight = 2, -- more space in the neovim command line for displaying messages
    -- completeopt = { 'menuone', 'noselect' }, -- mostly just for cmp

    hlsearch = true, -- highlight all matches on previous search pattern
    incsearch = true,
    ignorecase = true, -- ignore case in search patterns

    pumheight = 10, -- pop up menu height
    showmode = false, -- we don't need to see things like -- INSERT -- anymore

    termguicolors = true, -- set term gui colors (most terminals support this)

    timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)

    backup = false, -- creates a backup file
    swapfile = false, -- creates a swapfile

    undofile = true, -- enable persistent undo
    undodir = os.getenv('HOME') .. '/.vim/undodir', -- creates a swapfile

    updatetime = 50, -- faster completion (4000ms default)
    writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

    expandtab = true, -- convert tabs to spaces
    shiftwidth = 4, -- the number of spaces inserted for each indentation
    softtabstop = 4,
    tabstop = 4, -- insert 2 spaces for a tab
    cursorline = false, -- highlight the current line
    number = true, -- set numbered lines
    relativenumber = true, -- set relative numbered lines
    numberwidth = 4, -- set number column width to 4
    signcolumn = 'yes', -- always show the sign column, otherwise it would shift the text each time
    wrap = false, -- display lines as one long line
    scrolloff = 8, -- is one of my fav
    sidescrolloff = 8,
}

vim.opt.shortmess:append 'c'

vim.keymap.set('', '<space>', '<Nop>', {silent=true})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.cmd 'set whichwrap+=<,>,[,],h,l'
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
