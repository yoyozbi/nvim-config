--local wk = require('which-key')
function Map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ','


--Select all
Map('n', '<C-a>', 'gg<S-v>G', { desc = 'Select all file' })

--Lspsaga

-- move lines
Map('n', '<A-j>', ':m .+1<CR>==', { silent = true, desc = 'Move down a line' })
Map('n', '<A-k>', ':m .-2<CR>==', { silent = true, desc = 'Move up a line' })
Map('v', '<A-j>', ':m \'>+1<CR>gv=gv', { silent = true, desc = 'Move selection down' })
Map('v', '<A-k>', ':m \'<-2<CR>gv=gv', { silent = true, desc = 'Move selection up' })
--Tabs
Map("n", '<Tab>', '<Cmd>BufferLineCycleNext<CR>', { silent = true, desc = 'Go to next buffer' })
Map("n", "<S-Tab>", '<Cmd>BufferLineCyclePrev<CR>', { silent = true, desc = 'Go to previous buffer' })
Map("n", "<leader>bn", "<Cmd>BufferLineMoveNext<CR>", { silent = true, desc = 'Move tab to the right' })
Map("n", "<leader>bn", "<Cmd>BufferLineMovePrev<CR>", { silent = true, desc = 'Move tab to the left' })


-- Split window
Map('n', 'ss', ':split<Return><C-w>w', { silent = true, desc = 'Open horizontal split' })
Map('n', 'sv', ':vsplit<Return><C-w>w', { silent = true, desc = 'Open vertical split' })

-- Resize window
Map('n', '<C-w>+', '<C-w><')
Map('n', '<C-w>-', '<C-w>>')
Map('n', '+', '<C-w>+')
Map('n', '-', '<C-w>-')

-- telescope
Map('n', '<leader>tt', '<Cmd>Telescope grep_string<CR>', { silent = true })
Map('n', '<leader>tf', "<Cmd>Telescope find_files<CR>", { silent = true })
-- markdown preview
Map('n', '<leader>mo', '<Cmd>MarkdownPreview<CR>', { silent = true })
Map('n', '<leader>mq', '<Cmd>MarkdownPreviewStop<CR>', { silent = true })
Map('n', '<leader>mt', '<Cmd>MarkdownPreviewToggle<CR>', { silent = true })
-- run current c or c++ file


vim.api.nvim_command([[
  augroup CompileAndRunCPlusPlus
    autocmd! BufReadPost,BufWritePost *.cpp nnoremap <buffer> <F5> :w<Bar>!gcc  "%" -lstdc++ -o "%<.exe" && "%<.exe" <CR>
  augroup END
]])
vim.api.nvim_command([[
  augroup CompileAndRunC
    autocmd! BufReadPost,BufWritePost *.c nnoremap <buffer> <F5> :w<Bar>!gcc "%" -o "%<.exe" && "%<.exe" <CR>
  augroup END
]])
