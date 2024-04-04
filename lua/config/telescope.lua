local telescope = require "telescope"
local builtin = require "telescope.builtin"

telescope.load_extension('jj')

local vcs_picker = function(opts)
    local jj_pick_status, jj_res = pcall(telescope.extensions.jj.files, opts);
    if jj_pick_status then
        return
    end

    local git_files_status, git_res = pcall(builtin.git_files, opts);
    if not git_files_status then
        print(jj_res)
        print(git_res)
    end
end

vim.keymap.set("n", "<C-p>", vcs_picker, {})
vim.keymap.set("n", "<C-f>", builtin.grep_string, {})
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>pb", builtin.treesitter, {})
vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, {})
