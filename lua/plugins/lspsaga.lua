return {
  'nvimdev/lspsaga.nvim',
  enabled = true,
  lazy = false,
  config = function()
    require('lspsaga').setup({
      rename = {
        enable = false,
        in_select = false
      },
      lightbulb = {
        enable = false
      },
      code_action = {
        keys = {
          quit = '<esc>'
        }
      },
    })
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons',     -- optional
  }
}
