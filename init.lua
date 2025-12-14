require('config.base')
require('config.lazy')
require('config.keymaps')

-- https://github.com/yetone/avante.nvim/issues/2787
-- vim.defer_fn(function()
--   vim.cmd("AvanteSwitchProvider gemini")
--   vim.cmd("AvanteSwitchSelectorProvider snacks")
-- end, 200)

-- vim.cmd("colorscheme nightfox")

-- vim.api.nvim_set_hl(0, "DiffAdd", { fg = "NONE", ctermfg = "NONE" })
-- vim.api.nvim_set_hl(0, "DiffDelete", { fg = "NONE", ctermfg = "NONE" })
-- vim.api.nvim_set_hl(0, "DiffChange", { fg = "NONE", ctermfg = "NONE" })
-- vim.api.nvim_set_hl(0, "DiffText", { fg = "NONE", ctermfg = "NONE" })
-- vim.api.nvim_set_hl(0, "SnacksDiffAdd", { bg = "#009900" })

-- vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#263226", fg = "#d7ffaf", blend = 10 })    -- Fondo verde oscuro
-- vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#322626", fg = "#ffafaf", blend = 10 }) -- Fondo rojo oscuro
-- vim.api.nvim_set_hl(0, "DiffChange", { bg = "#262632", fg = "#afafff", blend = 10 }) -- Fondo azul oscuro
-- vim.api.nvim_set_hl(0, "DiffText", { bg = "#323226", fg = "#ffffaf", blend = 10 })   -- Fondo amarillo oscuro
