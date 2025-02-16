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
        style = 'dark',
        transparent = false,
      }
    end
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

  {
    "topazape/oldtale.nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  {'loctvl842/monokai-pro.nvim'},

  {'marko-cerovac/material.nvim'},

  {
    "aktersnurra/no-clown-fiesta.nvim",
    priority = 1000,
    config = true,
    lazy = false,
  },

  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = true 
  },

  { 
    'olivercederborg/poimandres.nvim',
    lazy = false,
    priority = 1000,
  },

  { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
}
