local dap = require('dap');
dap.adapters.lldb = {
   type = 'executable',
   command = '/usr/local/Cellar/llvm/15.0.7_1/bin/lldb-vscode',
   name = 'lldb'
}

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
      args = "-- --gtest_filter='TestVolumePoints.*'",
   },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

require('dapui').setup();
