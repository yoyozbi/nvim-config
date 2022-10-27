Map('n', '<leader>u', ":lua require('harpoon.ui').toggle_quick_menu() <CR>", { silent = true })
Map('n', '<leader>a', ":lua require('harpoon.mark').add_file() <CR>", { silent = true })
Map('n', '<leader>hp', ":lua require('harpoon.ui').nav_prev() <CR>", { silent = true })
Map('n', '<leader>hn', ":lua require('harpoon.ui').nav_next() <CR>", { silent = true })
for i = 0,9,1
do
  Map('n', '<leader>h' .. i, ":lua require('harpoon.ui').nav_file(".. i .. ') <CR>', { silent = true })
end
