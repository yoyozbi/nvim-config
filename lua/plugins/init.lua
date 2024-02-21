return {
	-- Colorscheme
	{
		'folke/tokyonight.nvim',
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			-- vim.cmd [[colorscheme tokyonight]]
		end
	},
	{
		'sainnhe/sonokai',
		lazy = false,
		priority =1000,
		opts = {},
		config = function()
			vim.cmd [[colorscheme sonokai]]
		end,
	},
	-- {
	-- 	"craftzdog/solarized-osaka.nvim",
	-- 	lazy = true,
	-- 	priority = 1000,
	-- 	opts = function()
	-- 		return {
	-- 			transparent = true,
	-- 		}
	-- 	end,
	-- },

	-- File explorer
	{
		'nvim-tree/nvim-tree.lua',
		--lazy = true,
		dependencies = {
			'nvim-tree/nvim-web-devicons'
		},
		config = function()
			require('nvim-tree').setup({
				filters = {
					dotfiles = false,
					git_ignored = false,
				}
			})
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
