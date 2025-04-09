return {
  -- Install LSP config plugin
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Setup for clangd
      lspconfig.clangd.setup{}

      -- Setup for pyright
      lspconfig.pyright.setup{}
    end,
  },

  -- Mason plugin for managing LSP servers, linters, formatters, etc.
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- Optionally, you can also install mason-lspconfig for easier integration with LSP
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "clangd", "pyright" },  -- Example LSPs to install automatically
        automatic_installation = true,
      })
    end,
  }
}
