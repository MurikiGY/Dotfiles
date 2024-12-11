-- lua/plugins/rose-pine.lua
--return { 
--	"rose-pine/neovim", 
--	name = "rose-pine",
--	config = function()
--		vim.cmd("colorscheme rose-pine")
--	end
--}


-- lua/plugins/rose-pine.lua
return {
  -- Add the moonlight color scheme plugin
  {
    'shaunsingh/moonlight.nvim',
    config = function()
      -- Configure the plugin (optional, defaults are usually fine)
      vim.cmd('colorscheme moonlight')
    end
  },
}

