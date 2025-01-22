return {
  'nvimdev/lspsaga.nvim',
  enabled = true,
  config = function()
    require('lspsaga').setup({
      rename = {
        in_select = false
      },
      lightbulb = {
        enable = false
      },
      code_action = {
        keys = {
          quit = '<esc>'
        }
      }
    })
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons',     -- optional
  }
}
