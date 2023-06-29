local dap = require('dap');
dap.adapters.lldb = {
   type = 'executable',
   command = '/usr/local/Cellar/llvm/15.0.7_1/bin/lldb-vscode',
   name = 'lldb'
}

function GetGTestArgs()
   local filter = vim.fn.input('--gtest_filter=');
   if string.len(filter) > 0 then
      local args = { '--gtest_filter=' .. filter }
      return args
   end
   return {}
end

dap.configurations.cpp = {
   {
      name = 'Launch',
      type = 'lldb',
      request = 'launch',
      program = function()
         return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
      args = GetGTestArgs,
   },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

local dapui = require('dapui');
dapui.setup()
vim.keymap.set('n', '<leader>dd', dapui.toggle)
