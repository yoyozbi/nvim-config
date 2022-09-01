vim.opt.clipboard:prepend { 'unnamed', 'unnamedplus' }
vim.keymap.set('n', 'rr', ':source ' .. os.getenv("LOCALAPPDATA") .. "\\nvim\\init.lua <CR>")
vim.cmd("set shell=cmd")
