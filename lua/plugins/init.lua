return {
	-- Colorscheme
	{
		'folke/tokyonight.nvim',
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd [[colorscheme tokyonight]]
		end
	},

	-- File explorer
	{
		'nvim-tree/nvim-tree.lua',
		--lazy = true,
		dependencies = {
			'nvim-tree/nvim-web-devicons'
		},
		config = function()
			require('nvim-tree').setup()
		end

	},
	{
		'numToStr/Comment.nvim',
		lazy = false
	},
	-- Telescope
	{
		'nvim-telescope/telescope.nvim',
		lazy = true,
		dependencies = {
			{ 'nvim-lua/plenary.nvim' }
		},
		keys = {
			{ "<leader>fc", "<cmd>Telescope colorscheme<cr>",                         "Colorscheme" },
			{ "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find files" },
			{ "<leader>ft", "<cmd>Telescope live_grep<cr>",                           "Find text pattern" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<cr>",                            "Recent files" }
		}
	},

	-- Auto pairs
	{
		'windwp/nvim-autopairs',
		config = function()
			require('nvim-autopairs').setup()
		end
	},

	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {

		}
	},
	{
		"lambdalisue/suda.vim",
		lazy = false
	}

}
