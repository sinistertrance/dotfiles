-- Lsp Completion or The Suggestion thingy
local cmp = require('cmp')
require('luasnip.loaders.from_vscode').lazy_load()

local kind_icons = {
   Text = '',
   Method = '',
   Function = '',
   Constructor = '',
   Field = '',
   Variable = '',
   Class = '',
   Interface = '',
   Module = '',
   Property = '',
   Unit = '',
   Value = '',
   Enum = '',
   Keyword = '',
   Snippet = '',
   Color = '',
   File = '',
   Reference = '',
   Folder = '',
   EnumMember = '',
   Constant = '',
   Struct = '',
   Event = '',
   Operator = '',
   TypeParameter = '',
}

cmp.setup({
   snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
      -- vim.fn['vsnip#anonymous'](args.body) -- For `vsnip` users.
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn['UltiSnips#Anon'](args.body) -- For `ultisnips` users.
      end,
   },
   mapping = cmp.mapping.preset.insert({
      ['<TAB>'] = cmp.mapping.confirm({ select = true }),
   }),
   window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
   },
   formatting = {
      fields = { 'kind', 'abbr', 'menu' },
      format = function(entry, vim_item)
      vim_item.kind = kind_icons[vim_item.kind]
      vim_item.menu = ({
         nvim_lsp = '',
         nvim_lua = '',
         luasnip = '',
         buffer = '',
         path = '',
         emoji = '',
      })[entry.source.name]
      return vim_item
      end,
   },
   sources = cmp.config.sources({
      { name = 'nvim_lsp_signature_help' },
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
   }, {
   { name = 'buffer' },
})
})
