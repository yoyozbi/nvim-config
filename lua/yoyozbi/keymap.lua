function Map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


--Select all
Map('n', '<C-a>','gg<S-v>G')

-- move lines
Map('n', '<A-j>', ':m .+1<CR>==', { silent = true })
Map('n', '<A-k>', ':m .-2<CR>==', { silent = true })
Map('i', '<A-j>', '<Esc>:m .+1<CR>==', { silent = true })
Map('i', '<A-k>', '<Esc>:m .-2<CR>==', { silent = true })
Map('v', '<A-j>', ':m \'>+1<CR>gv=gv', { silent = true })
Map('v', '<A-k>', ':m \'<-2<CR>gv=gv', { silent = true })

-- New tab
Map('n', 'te', ':tabedit', { silent = true })
-- split current window into new tab
Map('n', 'to', ':tab split <CR>', { silent = true })
-- Move windows
Map('n', 'tn', ':tabm +1', { silent = true })
Map('n', 'tp', ':tabm -1', { silent = true})
-- Split window
Map('n', 'ss', ':split<Return><C-w>w', { silent = true })
Map('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })
-- Move window
Map('n', '<Space>', '<C-w>w')
Map('', 'sh', '<C-w>h')
Map('', 'sk', '<C-w>k')
Map('', 'sj', '<C-w>j')
Map('', 'sl', '<C-w>l')

-- Resize window
Map('n', '<C-w>+', '<C-w><')
Map('n', '<C-w>-', '<C-w>>')
Map('n', '+', '<C-w>+')
Map('n', '-', '<C-w>-')

-- terminal escape
Map('t', '<Esc>', '<C-\\><C-n>')
-- telescope
Map('n', 'tt', ':Telescope grep_string <CR>', { silent = true })
Map('n', 'tf', ":Telescope find_files <CR>", { silent = true })
-- run current c file 
Map('', '<F5>', ':!gcc "%" -o "%<.exe" && "%<.exe" <CR>')