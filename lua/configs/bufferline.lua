local M = {}
function M.config()
 require'bufferline'.setup { 
   numbers = "buffer_id",
   diagnostic = "coc"
 }
end
return M
