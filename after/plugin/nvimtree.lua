-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true })
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup({
  git = {
    ignore = false,
  },
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    side = "right"
  },
  renderer = {
    group_empty = true,
    icons = {
      show = {
        folder_arrow = false,
      }
    }
  },
  -- filters = {
  --   dotfiles = true,
  -- },
})

vim.keymap.set('n', '<leader>n', ':NvimTreeFindFileToggle<CR>')

-- Close nvim tree if it is the last buffer 
vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
  pattern = "NvimTree_*",
  callback = function()
    local layout = vim.api.nvim_call_function("winlayout", {})
    if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then vim.cmd("confirm quit") end
  end
})
