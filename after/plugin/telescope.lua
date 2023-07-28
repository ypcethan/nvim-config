local telescope = require('telescope')
local actions = require('telescope.actions')
local lga_actions = require("telescope-live-grep-args.actions")

vim.cmd([[
  highlight link TelescopePromptTitle PMenuSel
  highlight link TelescopePreviewTitle PMenuSel
  highlight link TelescopePromptNormal NormalFloat
  highlight link TelescopePromptBorder FloatBorder
  highlight link TelescopeNormal CursorLine
  highlight link TelescopeBorder CursorLineBg
]])

telescope.setup({
  defaults = {
    path_display = { truncate = 1 },
    prompt_prefix = '   ',
    selection_caret = '  ',
    layout_config = {
      prompt_position = 'top',
    },
    sorting_strategy = 'ascending',
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ['<C-i>'] = actions.cycle_history_next,
        ['<C-o>'] = actions.cycle_history_prev,
        ['<C-f>'] = actions.toggle_selection,
        ['<Leader>q'] = actions.send_selected_to_qflist,
        ["<C-k>"] = lga_actions.quote_prompt(),
        ["<C-t>"] = lga_actions.quote_prompt({ postfix = " -t" }),
        ["<C-e>"] = lga_actions.quote_prompt({ postfix = " -g " }),
        -- ["<C-g>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
      },
    },
    file_ignore_patterns = { '.git/' },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    buffers = {
      previewer = false,
      layout_config = {
        width = 80,
      },
    },
    oldfiles = {
      prompt_title = 'History',
    },
    lsp_references = {
      previewer = false,
    },
  },
  media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = {"png", "webp", "jpg", "jpeg"},
      -- find command (defaults to `fd`)
      find_cmd = "rg"
  },
  -- extensions = {
  --   live_grep_args = {
  --     -- auto_quoting = true, -- enable/disable auto-quoting
  --     -- define mappings, e.g.
  --     mappings = { -- extend mappings
  --       i = {
  --         ["<C-k>"] = lga_actions.quote_prompt(),
  --         ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
  --       },
  --     },
  --   }
  -- }
})


require('telescope').load_extension('fzf')
require('telescope').load_extension('live_grep_args')
require("telescope").load_extension('harpoon')
require'telescope'.load_extension('project')
vim.keymap.set('n', '<C-p>', [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
vim.keymap.set('n', '<leader>f', [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files' })<CR>]]) -- luacheck: no max line length
vim.keymap.set('n', '<leader>b', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
vim.keymap.set('n', '<leader>g', [[<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]])
vim.keymap.set('n', '<leader>h', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]])
vim.keymap.set('n', '<leader>s', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]])
