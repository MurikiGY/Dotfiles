return {
  -- Install nvim-web-devicons
  {
    "kyazdani42/nvim-web-devicons",
    config = function()
      -- Additional configuration if needed
    end,
  },

  -- Install nvim-tree itself
  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup()
    end,
  },
}

