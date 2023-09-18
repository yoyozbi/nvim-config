vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = " "
vim.opt.encoding = "utf-8"
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.encoding = "utf-8"
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.termguicolors = true
vim.wo.signcolumn = 'yes'

vim.cmd [[
	set nohlsearch
	set noexpandtab
	set nowrap
	set formatoptions-=cro
	set colorcolumn=80
	set clipboard^=unnamed,unnamedplus
]]
