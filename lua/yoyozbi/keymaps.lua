function Map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


--Select all
Map('n', '<C-a>','gg<S-v>G')

--Lspsaga
Map('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
Map('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
Map('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
Map('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
Map('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)
Map('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)

-- move lines
Map('n', '<A-j>', ':m .+1<CR>==', { silent = true })
Map('n', '<A-k>', ':m .-2<CR>==', { silent = true })
Map('i', '<A-j>', '<Esc>:m .+1<CR>==', { silent = true })
Map('i', '<A-k>', '<Esc>:m .-2<CR>==', { silent = true })
Map('v', '<A-j>', ':m \'>+1<CR>gv=gv', { silent = true })
Map('v', '<A-k>', ':m \'<-2<CR>gv=gv', { silent = true })
--Tabs
Map("n", '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {silent = true})
Map("n", "<S-Tab>", '<Cmd>BufferLineCyclePrev<CR>', {silent = true})
Map("n","tn", "<Cmd>BufferLineMoveNext<CR>", {silent = true})
Map("n", "tp", "<Cmd>BufferLineMovePrev<CR>", {silent = true})

-- Split window
Map('n', 'ss', ':split<Return><C-w>w', { silent = true })
Map('n', 'sv', ':vsplit<Return><C-w>w', { silent = true})

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
Map('n', 'tt', '<Cmd>Telescope grep_string<CR>', { silent = true })
Map('n', 'tf', "<Cmd>Telescope find_files<CR>", { silent = true })
-- markdown preview
Map('n', 'mo', '<Cmd>MarkdownPreview<CR>', { silent = true })
Map('n','mq', '<Cmd>MarkdownPreviewStop<CR>', { silent =true })
Map('n', 'mt', '<Cmd>MarkdownPreviewToggle<CR>', { silent = true })
-- run current c file 
Map('', '<F5>', ':!gcc "%" -o "%<.exe" && "%<.exe" <CR>')
