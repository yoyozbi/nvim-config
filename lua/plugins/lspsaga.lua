return {
	{
		'nvimdev/lspsaga.nvim',
		event = 'LspAttach',
		config = function()
			require('lspsaga').setup({})
			require('nvim-treesitter.configs').setup({
				ensure_installed = { "markdown", "markdown_inline", "regex", "bash", 'svelte', 'typescript', 'javascript' }
				-- highlight = {
					-- enable = true,
				-- }
			})
		end,
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
			'nvim-tree/nvim-web-devicons'
		},
	}
}
