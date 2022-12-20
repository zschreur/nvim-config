vim.diagnostic.config({
	virtual_text = false,
})

local on_attach = function(client, bufnr)
    local bufopts = { buffer = bufnr, remap = false }

    if client.name == "eslint" then
        vim.cmd.LspStop("eslint")
        return
    end

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, bufopts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, bufopts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, bufopts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, bufopts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
end

require "lspconfig".clangd.setup {
    on_attach = on_attach
}
require "lspconfig".eslint.setup {
    on_attach = on_attach
}
require "lspconfig".tsserver.setup {
    on_attach = on_attach
}
require "lspconfig".rust_analyzer.setup {
    on_attach = on_attach
}
require "lspconfig".sumneko_lua.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you"re using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
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
