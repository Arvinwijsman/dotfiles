-- LSP configs
local lspconfig = require("lspconfig")
local cmp = require("cmp")
local keys = require("awiseguy.keys")
local servers = { 'pyright', 'intelephense' }

for _, lsp in pairs(servers) do
  require("lspconfig")[lsp].setup({
    on_attach = keys.on_lsp_attach,
    flags = {
      debounce_text_changes = 150,
    }
  })
end

-- Autocomplete nvim-cmp
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'orgmode' }
  },
}

-- Bindings
keys.lsp_general()
