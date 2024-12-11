-- nvim-tree
return {
  -- Lazy.nvim plugins configuration
  { 
    "nvim-tree/nvim-tree.lua", 
    config = function()
      -- Call the configuration function after installation
      require('nvim-tree').setup {
        -- Your custom configuration will go here
      }
    end
  },
}

