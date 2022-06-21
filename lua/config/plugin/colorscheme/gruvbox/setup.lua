local style = "hard"
vim.g.gruvbox_contrast_dark = style
require("gruvbox").load()

local c = require("gruvbox.colors")
local normal_bg = style == "medium" and c.dark0 or c["dark0_" .. style]

require("sugar.highlight").colorscheme(function(h)
  local set, link, fg, bg, blend = h.set, h.link, h.fg, h.bg, h.blend

  -- highlight-default
  set("CursorLine", { bg = blend(bg("CursorLine"), normal_bg, 0.3) })
  set("CursorLineNr", { fg = c.bright_yellow })
  set("DiagnosticSignInfo", { inherit = "DiagnosticSignInfo", bg = "NONE" })
  set("DiagnosticSignWarn", { inherit = "DiagnosticSignWarn", bg = "NONE" })
  set("DiagnosticSignHint", { inherit = "DiagnosticSignHint", bg = "NONE" })
  set("DiagnosticSignError", { inherit = "DiagnosticSignError", bg = "NONE" })
  set("DiffAdd", { inherit = "DiffAdd", reverse = false })
  set("DiffChange", { inherit = "DiffChange", reverse = false })
  set("DiffDelete", { inherit = "DiffDelete", reverse = false })
  set("DiffText", { inherit = "DiffText", reverse = false })
  set("LineNr", { fg = c.light3 })
  link("NormalFloat", "Normal")
  link("SignColumn", "LineNr")
  set("StatusLine", { bg = c.dark1, fg = c.light2 })
  set("TabLineSel", { inherit = "TabLineSel", bg = normal_bg })
  set("VertSplit", { fg = bg("StatusLine") })

  -- health
  link("healthError", "DiagnosticError")
  set("healthSuccess", { fg = c.bright_green })
  link("healthWarning", "DiagnosticWarn")

  -- plugin
  link("CmpCursorLine", "CursorLine")
  link("CmpDocumentationBorder", "LineNr")
  set("GitSignsAdd", { inherit = "GitSignsAdd", bg = "NONE" })
  set("GitSignsAddLn", { bg = blend(fg("GitSignsAdd"), normal_bg, 0.15) })
  set("GitSignsAddInline", { bg = blend(fg("GitSignsAdd"), normal_bg, 0.05) })
  set("GitSignsChange", { inherit = "GitSignsChange", bg = "NONE" })
  set("GitSignsChangeLn", { bg = blend(fg("GitSignsChange"), normal_bg, 0.15) })
  set("GitSignsChangeInline", {
    bg = blend(fg("GitSignsChange"), normal_bg, 0.05),
  })
  set("GitSignsDelete", { inherit = "GitSignsDelete", bg = "NONE" })
  set("GitSignsDeleteLn", { bg = blend(fg("GitSignsDelete"), normal_bg, 0.15) })
  set("GitSignsDeleteInline", {
    bg = blend(fg("GitSignsDelete"), normal_bg, 0.05),
  })
  link("InclineNormal", "StatusLine")
  set("InclineNormalNC", { inherit = "StatusLine", fg = fg("Comment") })
  set("InclineWinNr", {
    fg = c.bright_yellow,
    bg = blend(c.bright_yellow, bg("StatusLine"), 0.1),
  })
  link("LTSymbolDetail", "Comment")
  link("LTSymbolJump", "LspReferenceText")
  set("ModesCopy", { bg = fg("IncSearch") })
  set("ModesDelete", { bg = c.bright_red })
  set("ModesInsert", { bg = c.bright_blue })
  set("ModesVisual", { bg = c.bright_orange })
  link("NotifyTRACEBorder", "DiagnosticHint")
  link("NotifyTRACETitle", "NotifyTRACEBorder")
  link("NotifyTRACEIcon", "NotifyTRACEBorder")
  set("NotifyDEBUGBorder", { fg = c.gray })
  link("NotifyDEBUGTitle", "NotifyDEBUGBorder")
  link("NotifyDEBUGIcon", "NotifyDEBUGBorder")
  link("NotifyINFOBorder", "DiagnosticInfo")
  link("NotifyINFOTitle", "NotifyINFOBorder")
  link("NotifyINFOIcon", "NotifyINFOBorder")
  link("NotifyWARNBorder", "DiagnosticWarn")
  link("NotifyWARNTitle", "NotifyWARNBorder")
  link("NotifyWARNIcon", "NotifyWARNBorder")
  link("NotifyERRORBorder", "DiagnosticError")
  link("NotifyERRORTitle", "NotifyERRORBorder")
  link("NotifyERRORIcon", "NotifyERRORBorder")
  set("StatusLineGitBranch", { inherit = "StatusLine", fg = c.bright_purple })
  set("StatusLineModified", { inherit = "StatusLine", fg = c.bright_red })
  set("StatusLinePath", { inherit = "StatusLine", fg = fg("Comment") })
  set("StatusLineRO", { inherit = "StatusLine", fg = c.faded_red })
  set("StatusLineMNormal", { fg = c.bright_yellow })
  set("StatusLineMInsert", { fg = c.bright_blue })
  set("StatusLineMVisual", { fg = c.bright_orange })
  set("StatusLineMReplace", { fg = c.bright_aqua })
  set("StatusLineMCommand", { fg = c.bright_red })
  set("TabLineModified", { inherit = "TabLine", fg = c.bright_red })
  link("TabLineSep", "TabLine")
  set("TabLineModifiedSel", { inherit = "TabLineSel", fg = c.bright_red })
  set("TabLineSepSel", { inherit = "TabLineSel", fg = c.bright_blue })
  set("TreesitterContext", { bg = bg("StatusLine") })
  set("WinSeparatorZen", { fg = bg("Normal") })
end)
