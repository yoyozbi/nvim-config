return {
	'akinsho/toggleterm.nvim',
	version = "*",
	config = function()
		local Terminal = require('toggleterm.terminal').Terminal
		local lazygit = Terminal:new({cmd = "lazygit", hidden = true, direction = "tab", close_on_exit=true })
		function lazygit_toggle()
			lazygit:toggle()
		end
	end,


}
