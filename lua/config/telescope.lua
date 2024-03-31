local builtin = require"telescope.builtin"
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local utils = require "telescope.utils"
local conf = require("telescope.config").values

local jj_files = function(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "Jujutsu Files",
    finder = finders.new_table {
      results = utils.get_os_command_output({ "jj", "files", "--no-pager" }),
    },
    sorter = conf.generic_sorter(opts),
  }):find()
end

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", jj_files, {})
vim.keymap.set("n", "<C-f>", builtin.grep_string, {})
vim.keymap.set("n", "<leader>pb", builtin.treesitter, {})
vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})
