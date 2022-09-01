require('craftzdog.base')
require('craftzdog.highlights')
require('craftzdog.maps')
require('craftzdog.plugins')

local has = function(x)
  return vim.fn.has(x) == 1
end

local is_win = has "win32"
local is_linux = has "unix"

if is_linux then
  require('craftzdog.linux')
end
if is_win then
  require('craftzdog.windows')
end
