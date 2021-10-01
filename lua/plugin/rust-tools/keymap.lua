local M = {}

function M.attach()
  local keymap = require("lib.keymap")
  local on = keymap.on_press
  local opt = keymap.opt
  keymap.bind({
    on("[rr", "n"):exec("RustToggleInlayHints"),
    on("[rR", "n"):exec("RustRunnables"),
    on("[rE", "n"):exec("RustExpandMacro"),
    on("[rc", "n"):exec("RustOpenCargo"),
    on("[rP", "n"):exec("RustParentModule"),
    on("[rJ", "n"):exec("RustJoinLines"),
    on("[ra", "n"):exec("RustHoverActions"),
    on("[ra", "v"):exec("RustHoverRange"),
    on("[rj", "a"):exec("RustMoveItemDown"),
    on("[rk", "a"):exec("RustMoveItemUp"),
  }, {
    options = opt():noremap(),
  })
end

return M
