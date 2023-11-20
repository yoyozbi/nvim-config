return {
	'akinsho/toggleterm.nvim',
	version = "*",
	config = function()
		require('toggleterm').setup()
		local Terminal = require('toggleterm.terminal').Terminal
		local lazygit = Terminal:new({cmd = "lazygit", hidden = true, direction = "tab", close_on_exit=true })
		function lazygit_toggle()
			lazygit:toggle()
		end
		vim.api.nvim_set_keymap('t', "<Esc>", '<C-\\><C-n>', {noremap = true, silent = true, desc = "Exit terminal mode"})
			
	end,


}
