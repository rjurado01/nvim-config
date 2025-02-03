return {
  {
    'romainl/Apprentice',
    enabled = true,
    config = function()
      -- Cargar el tema Apprentice
      vim.cmd("colorscheme apprentice")

      -- Personalizar los colores de diffview con fondos casi #262626 y matices sutiles
      vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#263226", fg = "#d7ffaf", blend = 10 })    -- Fondo verde oscuro
      vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#322626", fg = "#ffafaf", blend = 10 }) -- Fondo rojo oscuro
      vim.api.nvim_set_hl(0, "DiffChange", { bg = "#262632", fg = "#afafff", blend = 10 }) -- Fondo azul oscuro
      vim.api.nvim_set_hl(0, "DiffText", { bg = "#323226", fg = "#ffffaf", blend = 10 })   -- Fondo amarillo oscuro
    end,
  },

  {
    'rose-pine/neovim',
  },

  {
    "kvrohit/rasmus.nvim",
    enabled = true,
    priority = 1000,
    config = function()
      vim.g.rasmus_transparent = true
      -- vim.cmd([[colorscheme apprenticerasmus]])
    end,
  },

  {
    'navarasu/onedark.nvim',
    enabled = true,
    config = function()
      require('onedark').setup {
        style = 'warmer'
      }
    end
  },

  {
    "MarcoKorinth/onehalf.nvim",
    lazy = true
  },

  {
    'sainnhe/sonokai',
  },

  {
    "EdenEast/nightfox.nvim",
    opts = {
      options = {
        transparent = false,
      },
      palettes = {
        nordfox = {
          bg1 = "#2e3440",
        }
      },
    }
  },

  { 'sonph/onehalf' },
}
