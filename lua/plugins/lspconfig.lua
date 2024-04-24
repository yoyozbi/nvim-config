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
			local ensure_installed = { 'tsserver', 'html', 'emmet_ls', "clangd", 'dockerls',
				'docker_compose_language_service', 'clangd', 'intelephense', 'gopls',
				'eslint', 'lua_ls', 'svelte', 'tailwindcss', 'nixd', 'rust-analyser', 'yamlls'  }


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
					{ name = 'copilot', group_index = 2 },
					{ name = 'nvim_lsp', group_index = 2},
					{ name = 'nvim_lua', group_index = 2 },
					{ name = 'luasnip', group_index = 2 }
				},
				formatting = lsp_zero.cmp_format(),
				mapping = cmp.mapping.preset.insert({
					['<Enter>'] = cmp.mapping.confirm({ select = false }),
					['<C-e>'] = cmp.mapping.abort(),
					['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
					['<Tab>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
					['<C-S-Space>'] = cmp.mapping.complete(),
				}),
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end,
				},
			})

			require('luasnip.loaders.from_vscode').lazy_load()

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

			require'lspconfig'.tailwindcss.setup{}
			require'lspconfig'.nixd.setup{}
			require'lspconfig'.rust_analyzer.setup{}
			require'lspconfig'.yamlls.setup{
				settings = {
					yaml = {
						keyOrdering = false,
					}
				}
			}
		end,
	}
}
