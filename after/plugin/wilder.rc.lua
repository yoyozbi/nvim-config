local status, wilder = pcall(require, "wilder")
if (not status) then return end

wilder.setup({modes= {':', '/','?'}})
wilder.set_option('renderer', wilder.popupmenu_renderer({
  highlighter = wilder.basic_highlighter(),
  left = {' ', wilder.popupmenu_devicons()},
  right = {' ', wilder.popupmenu_scrollbar()}
}))
