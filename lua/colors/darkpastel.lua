-- lua/colors/darkpastel.lua
vim.cmd("hi clear")
vim.cmd("syntax reset")
vim.o.background = "dark"
vim.g.colors_name = "darkpastel"

local colors = {
  bg       = "#2F2F2F",
  fg       = "#E5E5DC",
  gray     = "#3F3F3F",
  red      = "#D58B8B",
  green    = "#60B48A",
  yellow   = "#D9A066",
  blue     = "#8C9BC4",
  magenta  = "#D485AD",
  cyan     = "#90B9B8",
  white    = "#E5E5DC",
  comment  = "#7A7A7A", -- derivado del gray, pero más claro
  cursor   = "#FFFFFF",
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- UI
hi("Normal",        { fg = colors.fg, bg = colors.bg })
hi("CursorLine",    { bg = "#404040" })
hi("CursorColumn",  { bg = "#404040" })
hi("Cursor",        { fg = colors.bg, bg = colors.cursor })
hi("Visual",        { bg = "#505050" })
hi("LineNr",        { fg = "#777777", bg = colors.bg })
hi("StatusLine",    { fg = colors.fg, bg = "#444444" })
hi("VertSplit",     { fg = "#444444", bg = "#444444" })
hi("Pmenu",         { fg = colors.fg, bg = "#3A3A3A" })
hi("PmenuSel",      { fg = colors.bg, bg = colors.blue })

-- Syntax
hi("Comment",       { fg = colors.comment, italic = true })
hi("Constant",      { fg = colors.yellow })
hi("String",        { fg = colors.green })
hi("Character",     { fg = colors.green })
hi("Number",        { fg = colors.yellow })
hi("Boolean",       { fg = colors.green })
hi("Float",         { fg = colors.yellow })

hi("Identifier",    { fg = colors.magenta })
hi("Function",      { fg = colors.blue })
hi("Statement",     { fg = colors.red })
hi("Conditional",   { fg = colors.red })
hi("Repeat",        { fg = colors.red })
hi("Label",         { fg = colors.cyan })
hi("Operator",      { fg = colors.fg })
hi("Keyword",       { fg = colors.red })
hi("Exception",     { fg = colors.red })

hi("PreProc",       { fg = colors.cyan })
hi("Include",       { fg = colors.cyan })
hi("Define",        { fg = colors.red })
hi("Macro",         { fg = colors.red })
hi("PreCondit",     { fg = colors.cyan })

hi("Type",          { fg = colors.cyan })
hi("StorageClass",  { fg = colors.cyan })
hi("Structure",     { fg = colors.cyan })
hi("Typedef",       { fg = colors.cyan })

hi("Special",       { fg = colors.blue })
hi("SpecialChar",   { fg = colors.yellow })
hi("Tag",           { fg = colors.blue })
hi("Delimiter",     { fg = colors.white })
hi("SpecialComment",{ fg = colors.comment })
hi("Debug",         { fg = colors.red })

hi("Todo",          { fg = colors.yellow, bold = true })

-- Diffs
hi("DiffAdd",       { bg = "#335544" })
hi("DiffChange",    { bg = "#344455" })
hi("DiffDelete",    { bg = "#553344" })
hi("DiffText",      { bg = "#336688" })

-- Diagnostics
hi("DiagnosticError", { fg = colors.red })
hi("DiagnosticWarn",  { fg = colors.yellow })
hi("DiagnosticInfo",  { fg = colors.blue })
hi("DiagnosticHint",  { fg = colors.cyan })
