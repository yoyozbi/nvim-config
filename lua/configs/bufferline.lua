local M = {}
function M.config()
 require'bufferline'.setup { 
   numbers = "buffer_id",
   diagnostic = "nvim_lsp"
 }
end
return M
