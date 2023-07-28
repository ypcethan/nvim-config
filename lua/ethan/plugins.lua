require("packer").startup(function(use)
	-- Package manager
	use("wbthomason/packer.nvim")
	use("christoomey/vim-tmux-navigator")
	use("farmergreg/vim-lastplace") -- Jump to the last location when opening a file
	use("tpope/vim-commentary")
	use("tpope/vim-repeat")
	use("tpope/vim-surround")
	use("tpope/vim-eunuch")               -- Adds :Rename, :SudoWrite
	use("tpope/vim-unimpaired")           -- Adds [b and other handy mappings
	use("tpope/vim-sleuth")               -- Indent autodetection with editorconfig support
	use("jessarcher/vim-heritage")        -- Automatically create parent dirs when saving
	use("nelstrom/vim-visual-star-search") -- Enable * searching with visually selected text.
	use("sheerun/vim-polyglot")           -- Add more langauges

	-- Adding text object to select HTML attribute
	-- ix, ax
	use({
		"whatyouhide/vim-textobj-xmlattr",
		requires = "kana/vim-textobj-user",
	})

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	})

	-- Add smooth scolling to avoid jarring jumps
	use({
		"karb94/neoscroll.nvim",
	})

	-- Close buffer without close the window
	use({
		"famiu/bufdelete.nvim",
		config = function()
			vim.keymap.set("n", "<Leader>q", ":Bdelete<CR>")
		end,
	})

	-- Split arrays and method onto multiple lines, or join them back.
	use({
		"AndrewRadev/splitjoin.vim",
	})

	-- Automatically fix indentation when pasting code.
	use({
		"sickill/vim-pasta",
	})

	use('ThePrimeagen/harpoon')
	use({ "nvim-telescope/telescope-project.nvim" })
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "kyazdani42/nvim-web-devicons" },
			{ "nvim-telescope/telescope-fzf-native.nvim",    run = "make" },
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
		},
	})

	use({
		"lewis6991/gitsigns.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

	use({
		"tpope/vim-fugitive",
		requires = "tpope/vim-rhubarb",
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		requires = {
			"nvim-treesitter/playground",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
	})

	use { 'neoclide/coc.nvim', branch = 'release' }
	use({ "romainl/vim-cool" })
	use("christoomey/vim-tmux-runner")
	use({ "vim-test/vim-test" })

	use("vim-ruby/vim-ruby")
	use("tpope/vim-rails")
	use("tpope/vim-bundler")
	use("tpope/vim-rake")
	use("kana/vim-textobj-user")
	use('nelstrom/vim-textobj-rubyblock')
	use { "catppuccin/nvim", as = "catppuccin" }
end)


vim.cmd("colorscheme catppuccin-frappe")
require("catppuccin").setup({
    integrations = {
        coc_nvim = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
	harpoon = true,
	indent_blankline = true
    }
})
