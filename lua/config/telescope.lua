local builtin = require "telescope.builtin"
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local utils = require "telescope.utils"
local conf = require("telescope.config").values

local set_opts_cwd = function(opts)
    if opts.cwd then
        opts.cwd = vim.fn.expand(opts.cwd)
    else
        opts.cwd = vim.loop.cwd()
    end

    -- Find root of git directory and remove trailing newline characters
    local jj_root, ret = utils.get_os_command_output({ "jj", "workspace", "root" }, opts.cwd)
    local use_git_root = vim.F.if_nil(opts.use_git_root, true)

    if ret == 0 and use_git_root then
        opts.cwd = jj_root[1]
    end
end

local is_jj_repo = function()
    local in_jj = utils.get_os_command_output({ "jj", "log", "-T", "true", "--no-pager", "--no-graph", "-r", "@" })
    return in_jj[1] == "true"
end

local jj_files = function(opts)
    opts = opts or {}
    set_opts_cwd(opts)
    pickers.new(opts, {
        prompt_title = "Jujutsu Files",
        finder = finders.new_table {
            results = utils.get_os_command_output({ "jj", "files", "--no-pager" }, opts.cwd),
        },
        sorter = conf.generic_sorter(opts),
    }):find()
end

local vcs_picker = function(opts)
    if is_jj_repo() then
        jj_files(opts)
    else
        builtin.git_files(opts)
    end
end

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", vcs_picker, {})
vim.keymap.set("n", "<C-f>", builtin.grep_string, {})
vim.keymap.set("n", "<leader>pb", builtin.treesitter, {})
vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})
