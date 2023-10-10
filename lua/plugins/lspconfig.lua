return {
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		lazy = false,
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lua' },

			-- Snippets
			{
				'L3MON4D3/LuaSnip',
				dependencies = { 'rafamadriz/friendly-snippets' }
			},
			{ 'zbirenbaum/copilot-cmp' },
			{ 'zbirenbaum/copilot.lua' }
		},
		config = function()
			local ensure_installed = { 'tsserver', 'rust_analyzer', 'html', 'emmet_ls', "clangd", 'lua_ls', 'dockerls',
				'docker_compose_language_service', 'clangd', 'intelephense', 'gopls' }
			-- Auto format
			local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
			local lsp_format_on_save = function(bufnr)
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd('BufWritePre', {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format()
					end,
				})
			end

			-- Copilot
			require('copilot').setup({
				suggestion = { enabled = false },
				panel = { enabled = false }
			})
			require('copilot_cmp').setup()
			local lsp_zero = require('lsp-zero')

			lsp_zero.on_attach(function(client, bufnr)
				lsp_zero.default_keymaps({ buffer = bufnr })
				lsp_format_on_save(bufnr)
			end)
			local cmp = require('cmp')

			cmp.setup({
				sources = {
					{ name = 'copilot' },
					{ name = 'nvim_lsp' }
				},
				mapping = {
					['<Enter>'] = cmp.mapping.confirm({ select = false }),
					['<C-e>'] = cmp.mapping.abort(),
					['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
					['<Tab>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
					['<C-p>'] = cmp.mapping(function()
						if cmp.visible() then
							cmp.select_prev_item({ behavior = 'insert' })
						else
							cmp.complete()
						end
					end),
					['<C-n>'] = cmp.mapping(function()
						if cmp.visible() then
							cmp.select_next_item({ behavior = 'insert' })
						else
							cmp.complete()
						end
					end),
				},
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end,
				},
			})

			require('mason').setup()
			require('mason-lspconfig').setup({
				ensure_installed = ensure_installed,
				handlers = {
					lsp_zero.default_setup,
					lua_ls = function()
						local lua_opts = lsp_zero.nvim_lua_ls()
						require('lspconfig').lua_ls.setup(lua_opts)
					end,
				},
			})

			-- Nix
			require'lspconfig'.nixd.setup{}
		end,
	}
}
