return {
  -- Install nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",  -- Run the Tree-sitter installation and update after installation
    config = function()
      require'nvim-treesitter.configs'.setup {
        --ensure_installed = { "c", "bash", "lua", "python" },
        highlight = {
          enable = true,  -- Enable syntax highlighting
        },
        indent = {
          enable = true,  -- Enable automatic indentation based on Tree-sitter parsing
        },
        autopairs = {
          enable = true,  -- Enable Tree-sitter-based autopairs (for parens, quotes, etc.)
        },
        -- Add other modules as needed (e.g., for folding, text objects, etc.)
      }
    end
  },

  -- Optionally: Install nvim-treesitter-textobjects (for text object support)
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
    config = function()
      require'nvim-treesitter.configs'.setup {
        textobjects = {
          select = {
            enable = true,
            lookahead = true,  -- Enable lookahead to make selections more accurate
            keymaps = {
              ["af"] = "@function.outer",  -- Select the entire function
              ["if"] = "@function.inner",  -- Select inside a function
              ["ac"] = "@class.outer",  -- Select the entire class
              ["ic"] = "@class.inner",  -- Select inside a class
            },
          },
        }
      }
    end
  }
}
