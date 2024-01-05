return {
 {	
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.diagnostics.eslint,
					null_ls.builtins.code_actions.eslint_d,
					null_ls.builtins.completion.spell
				}
			})
		end,

		dependencies = {
			"nvim-lua/plenary.nvim"
		}
	}
}
