require("harpoon").setup()

vim.keymap.set('n','<leader>jj', '<cmd>lua require("harpoon.mark").add_file()<CR>')
vim.keymap.set('n','<leader>jm', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>')
vim.keymap.set('n','<leader>jc', '<cmd>lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>')
vim.keymap.set('n','<leader>u', '<cmd>lua require("harpoon.ui").nav_file(1)<CR>')
vim.keymap.set('n','<leader>i', '<cmd>lua require("harpoon.ui").nav_file(2)<CR>')
vim.keymap.set('n','<leader>o', '<cmd>lua require("harpoon.ui").nav_file(3)<CR>')
vim.keymap.set('n','<leader>p', '<cmd>lua require("harpoon.ui").nav_file(4)<CR>')
