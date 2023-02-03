local cmp = require'cmp'
local cmp_select = {behavior = cmp.SelectBehavior.Select}

local enable_snippets = true

local snip_status_ok, luasnip
if enable_snippets then
    snip_status_ok, luasnip = pcall(require, 'luasnip')
   if not snip_status_ok then
      return
   end

   require('luasnip/loaders/from_vscode').lazy_load()
end

local setup_snippet = {
   expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
   end,
}

cmp.setup {
   snippet = setup_snippet,
   mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
      ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
      ['<C-y>'] = cmp.mapping.confirm({select = true}),
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-e>'] = cmp.mapping {
         i = cmp.mapping.abort(),
         c = cmp.mapping.close(),
      },
      ['<Tab>'] = nil,
      ['<S-Tab>'] = nil,
   },
   formatting = {
      fields = { 'kind', 'abbr', 'menu' },
      format = function(entry, vim_item)
         vim_item.menu = ({
            nvim_lsp = '[LSP]',
            nvim_lua = '[NVIM_LUA]',
            luasnip = '[Snippet]',
            buffer = '[Buffer]',
            path = '[Path]',
         })[entry.source.name]
         return vim_item
      end,
   },
   sources = {
      -- Order of this will determine which items show first in the completion menu
      { name = 'nvim_lsp' },
      { name = 'nvim_lua' },
      { name = 'luasnip' },
      { name = 'buffer' },
      { name = 'path' },
   },
   confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
   },
   window = {
      documentation = cmp.config.window.bordered(),
   },
   experimental = {
      ghost_text = true,
      native_menu = false,
   },
}
