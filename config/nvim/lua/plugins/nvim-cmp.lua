return {
  -- Autocompletion plugin
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",  -- LSP source
      "hrsh7th/cmp-buffer",     -- Buffer completions
      "hrsh7th/cmp-path",       -- Path completions
      "hrsh7th/cmp-cmdline",    -- Command line completions
      "L3MON4D3/LuaSnip",       -- Snippet engine
      "saadparwaiz1/cmp_luasnip" -- Snippet completions
    },
    config = function()
      local cmp = require'cmp'
      cmp.setup {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)  -- For LuaSnip users.
          end,
        },
        mapping = {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'luasnip' },
        },
      }
    end,
  },
}

