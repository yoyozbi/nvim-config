return {
	{
		'goolord/alpha-nvim',
		lazy = true,
		keys = {
			{ "<leader>a", "<cmd>Alpha<cr>", desc = "Alpha" }
		},
		dependencies = {
			'nvim-tree/nvim-web-devicons'
		},
		config = function()
			require('alpha').setup(require('alpha.themes.dashboard').config)
		end
	},
}
