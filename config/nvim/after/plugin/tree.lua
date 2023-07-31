-- disable netrw at the very start of your init.lua (strongly advised)
--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>b", vim.cmd.bn)

--local function open_nvim_tree()
--  require("nvim-tree.api").tree.open()
--end
--vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })


