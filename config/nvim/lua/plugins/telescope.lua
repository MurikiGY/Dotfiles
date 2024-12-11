return {
  {
    "nvim-telescope/telescope.nvim", 
    dependencies = { 
      "nvim-lua/plenary.nvim", -- This is a dependency for telescope
    },
    config = function()
      require('telescope').setup {
        defaults = {
          -- Set some default configurations for telescope here
          mappings = {
            i = {
              ["<C-u>"] = false, -- Disable some key mappings if necessary
              ["<C-d>"] = false, 
            },
          },
        },
      }
    end
  },

  -- Optional: Install telescope extensions
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require('telescope').load_extension('fzf')
    end
  }
}

