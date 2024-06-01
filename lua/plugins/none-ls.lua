return {
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.diagnostics.phpcs,
					--null_ls.builtins.formatting.phpcsfixer,
					require("none-ls.diagnostics.eslint"),
					require("none-ls.code_actions.eslint_d"),
					null_ls.builtins.completion.spell,
					require("none-ls.formatting.eslint"),
					require("none-ls.formatting.rustfmt"),
				},
			})
		end,

		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvimtools/none-ls-extras.nvim",
		},
	},
}
