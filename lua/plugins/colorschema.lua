return {
  {
    'romainl/Apprentice',
    config = function()
      vim.cmd([[colorscheme apprentice]])
    end,
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
    enabled = false,
    config = function()
      require('onedark').setup {
        style = 'warmer'
      }
    end
  },

  {
    "MarcoKorinth/onehalf.nvim",
    lazy = false
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
