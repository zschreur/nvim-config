-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { silent=true }
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_ --[[ client --]], bufnr)
   -- Enable completion triggered by <c-x><c-o>
   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

   -- Mappings.
   -- See `:help vim.lsp.*` for documentation on any of the below functions
   local bufopts = { silent=true, buffer=bufnr }
   vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
   vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
   vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
   vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
   vim.keymap.set('n', '<C-i>', vim.lsp.buf.signature_help, bufopts)

   vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
   vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
   vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
   end, bufopts)

   vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
   vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
   vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
   vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

   vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format {
      async = true,
      -- This will prevent tsserver from running its formatter
      -- filter = function(client) return client.name ~= "tsserver" end
   } end, bufopts)
end

require'lspconfig'.clangd.setup{
   on_attach = on_attach
}
require'lspconfig'.eslint.setup{
   on_attach = on_attach
}
require'lspconfig'.tsserver.setup{
   on_attach = on_attach
}
require'lspconfig'.rust_analyzer.setup{
   on_attach = on_attach
}
require'lspconfig'.sumneko_lua.setup {
   on_attach = on_attach,
   settings = {
      Lua = {
         runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
         },
         diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
         },
         workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
         },
         -- Do not send telemetry data containing a randomized but unique identifier
         telemetry = {
            enable = false,
         }
      }
   }
}