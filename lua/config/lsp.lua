vim.diagnostic.config({
    virtual_text = false,
})

local on_attach = function(client, bufnr)
    local bufopts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, bufopts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, bufopts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, bufopts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<leader>f", function()
        if client.name == "lua_ls" then
            require("stylua-nvim").format_file()
        else
            vim.lsp.buf.format()
        end
    end, bufopts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)

    -- highligh on cursor hold
    vim.cmd("autocmd! CursorHold <buffer> lua vim.lsp.buf.document_highlight()")
    vim.cmd("autocmd! CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()")
    vim.cmd("autocmd! CursorMoved <buffer> lua vim.lsp.buf.clear_references()")
end

require("lspconfig").clangd.setup({
    on_attach = on_attach,
    cmd = { "clangd", "--clang-tidy" },
})
require("lspconfig").eslint.setup({
    on_attach = on_attach,
})
require("lspconfig").tsserver.setup({
    on_attach = on_attach,
    on_init = function(client)
        client.notify("workspace/didChangeConfiguration", {
            settings = {
                typescript = {
                    format = {
                        insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = false,
                    },
                },
            },
        })
    end,
})
require("lspconfig").rust_analyzer.setup({
    on_attach = on_attach,
})
require("lspconfig").lua_ls.setup({
    on_attach = on_attach,
    commands = {
        Format = {
            function()
                require("stylua-nvim").format_file()
            end,
        },
    },
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
            },
        },
    },
})
require("lspconfig").zls.setup({
    on_attach = on_attach,
})
