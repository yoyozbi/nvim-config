return {
	-- Mappings
	{
		"folke/which-key.nvim",
		--lazy = true,
		config = function()
			local which_key = require('which-key')
			local setup = {
				plugins = {
					marks = true, -- shows a list of your marks on ' and `
					registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
					spelling = {
						enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
						suggestions = 20, -- how many suggestions should be shown in the list?
					},
					-- the presets plugin, adds help for a bunch of default keybindings in Neovim
					-- No actual key bindings are created
					presets = {
						operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
						motions = true, -- adds help for motions
						text_objects = true, -- help for text objects triggered after entering an operator
						windows = true, -- default bindings on <c-w>
						nav = true,    -- misc bindings to work with windows
						z = true,      -- bindings for folds, spelling and others prefixed with z
						g = true,      -- bindings for prefixed with g
					},
				},
				-- add operators that will trigger motion and text object completion
				-- to enable all native operators, set the preset / operators plugin above
				operators = { gc = "Comments" },
				key_labels = {
					-- override the label used to display some keys. It doesn't effect WK in any other way.
					-- For example:
					-- ["<space>"] = "SPC",
					-- ["<cr>"] = "RET",
					-- ["<tab>"] = "TAB",
				},
				icons = {
					breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
					separator = "➜", -- symbol used between a key and it's label
					group = "+", -- symbol prepended to a group
				},
				popup_mappings = {
					scroll_down = "<c-d>", -- binding to scroll down inside the popup
					scroll_up = "<c-u>", -- binding to scroll up inside the popup
				},
				window = {
					border = "rounded",  -- none, single, double, shadow
					position = "bottom", -- bottom, top
					margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
					padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
					winblend = 0,
				},
				layout = {
					height = { min = 4, max = 25 },                                         -- min and max height of the columns
					width = { min = 20, max = 50 },                                         -- min and max width of the columns
					spacing = 3,                                                            -- spacing between columns
					align = "left",                                                         -- align columns left, center or right
				},
				ignore_missing = true,                                                    -- enable this to hide mappings for which you didn't specify a label
				hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
				show_help = true,                                                         -- show help message on the command line when the popup is visible
				triggers = "auto",                                                        -- automatically setup triggers
				-- triggers = {"<leader>"} -- or specify a list manually
				triggers_blacklist = {
					-- list of mode / prefixes that should never be hooked by WhichKey
					-- this is mostly relevant for key maps that start with a native binding
					-- most people should not need to change this
					i = { "j", "k" },
					v = { "j", "k" },
				},
			}
	
			local vopts = {
				mode = 'v',
				prefix = '<leader>',
				buffer = nil,
				silent = true,
				noremap = true,
				nowait = true
			}
			local vmappings = {
				["/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment toggle linewise (visual)" },
				l = {
					name = "LSP",
					a = { '<cmd>LspSaga code_action<cr>', "Code Action" }
				}
			}

			local opts = {
				mode = 'n',
				prefix = '<leader>',
				buffer = nil,
				silent = true,
				noremap = true,
				nowait = true
			}
			local mappings = {
				-- ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
				["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
				["k"] = { "<cmd>bdelete<cr>", "Kill Buffer" },
				["m"] = { "<cmd>Mason<cr>", "Mason" },
				["p"] = { "<cmd>Lazy<cr>", "Plugin Manager" },
				["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },

				-- Language Support
				l = {
					name = "LSP",
					i = { "<cmd>LspInfo<cr>", "Info" },
					r = { "<cmd>Lspsaga rename<cr>", "Rename" },
					s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
					S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
					o = { '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>',
						'Show line diagnostic' },
					a = { '<cmd>Lspsaga code_action<cr>', 'cursor action' }
				},
				-- diagnostics
				d = {
					name = "Diagnostics",
					n = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Jump to next diagnostic" },
					p = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Jump to previous diagnostic" },
					d = { "<mcd>Lspsaga show_cursor_diagnostics<cr>", "Show cursor diagnostic" }
				},

				-- Telescope
				-- f = {
				--   name = "File Search",
				--   c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
				--   f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Find files" },
				--   t = { "<cmd>Telescope live_grep <cr>", "Find Text Pattern" },
				--   r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
				-- },
				t = {
					name = "Toggleterm",
					t = {"<cmd>ToggleTerm<cr>", "Toggle terminal"},
					f = {"<cmd>ToggleTerm direction=float<cr>", "Toggle terminal float"},
					g = {"<cmd>lua lazygit_toggle()<cr>", "Open lazygit"},
				},

				s = {
					name = "Search",
					h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
					m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
					r = { "<cmd>Telescope registers<cr>", "Registers" },
					k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
					c = { "<cmd>Telescope commands<cr>", "Commands" },
				},
				b = {
					name = "buffers",
					n = { "<cmd>BufferLineCycleNext<cr>", "Next buffer" },
					b = { "<cmd>BufferLineCyclePrev<cr>", "Previous buffer" },
					p = { "<cmd>BufferLinePick<cr>", "Pick buffer" },
				}

			}

			which_key.setup(setup)
			which_key.register(mappings, opts)
			which_key.register(vmappings, vopts)

			which_key.register({
				["K"] = { "<cmd>Lspsaga hover_doc<cr>", "Docs" },
				["D"] = { "<cmd>Lspsaga peek_definition<cr>", "Peek definition" },
				["T"] = { "<cmd>Lspsaga peek_type_definition<cr>", "Peek type" },
				["E"] = { "<cmd>lua vim.diagnostic.open_float()<cr>", "View error" },
				["gr"] = { "<cmd>Lspsaga goto_definition", "Goto definition" }
			})
		end
	},
}
