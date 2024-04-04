local telescope = require "telescope"
local builtin = require "telescope.builtin"
local utils = require "telescope.utils"

telescope.load_extension('jj')

local is_jj_repo = function()
    local _, ret = utils.get_os_command_output({ "jj", "root" })
    return ret == 0
end

local vcs_picker = function(opts)
    if is_jj_repo() then
        return telescope.extensions.jj.pick(opts)
    end
    local status, res = pcall(builtin.git_files, opts);

    if not status then
        print(res)
    end
end

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", vcs_picker, {})
vim.keymap.set("n", "<C-f>", builtin.grep_string, {})
vim.keymap.set("n", "<leader>pb", builtin.treesitter, {})
vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, {})
