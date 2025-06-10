return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require('nightfox').setup({
        options = {
          transparent = false,
        },
        palettes = {
          nordfox = {
            bg1 = "#2e3440",
          }
        },
      })
    end
  },

  {
    'romainl/Apprentice',
    enabled = true,
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd("lua vim.print 'weeeeee'")
      -- Cargar el tema Apprentice
      -- vim.cmd("colorscheme apprentice")

      -- Personalizar los colores de diffview con fondos casi #262626 y matices sutiles
      -- vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#263226", fg = "#d7ffaf", blend = 10 })    -- Fondo verde oscuro
      -- vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#322626", fg = "#ffafaf", blend = 10 }) -- Fondo rojo oscuro
      -- vim.api.nvim_set_hl(0, "DiffChange", { bg = "#262632", fg = "#afafff", blend = 10 }) -- Fondo azul oscuro
      -- vim.api.nvim_set_hl(0, "DiffText", { bg = "#323226", fg = "#ffffaf", blend = 10 })   -- Fondo amarillo oscuro
    end,
  },

  {
    "kvrohit/rasmus.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.rasmus_transparent = true
    end,
  },

  {
    'navarasu/onedark.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      require('onedark').setup {
        style = 'dark',
        transparent = false,
      }
    end
  },

  -- { 'jacoborus/tender.vim', lazy = false, priority = 1000 },

  -- { 'AlexvZyl/nordic.nvim', lazy = false, priority = 1000 },
  -- { 'loctvl842/monokai-pro.nvim', lazy = false, priority = 1000 },
  -- { 'marko-cerovac/material.nvim', lazy = false, priority = 1000 },
  -- { 'olivercederborg/poimandres.nvim', lazy = false, priority = 1000 },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  -- { 'Mofiqul/vscode.nvim', lazy = false, priority = 1000 },
  -- { 'rebelot/kanagawa.nvim', lazy = false, priority = 1000 },
  { 'rose-pine/neovim', lazy = false, priority = 1000 },
  -- { 'clearaspect/onehalf', lazy = false, priority = 1000 },
  { 'shaunsingh/nord.nvim', lazy = false, priority = 1000 },
  -- { "topazape/oldtale.nvim", lazy = false, priority = 1000 },
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },
  -- { "aktersnurra/no-clown-fiesta.nvim", lazy = false, priority = 1000 },
  -- { 'projekt0n/github-nvim-theme', name = 'github-theme' },
  { 'kaiuri/nvim-juliana', lazy = false, priority = 1000 },
  { 'embark-theme/vim', lazy = false, priority = 1000 },
  { 'mhartington/oceanic-next', lazy = false, priority = 1000 },
}
