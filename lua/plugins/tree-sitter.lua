-- Lazy install nvim-treesitter
return { 
  'nvim-treesitter/nvim-treesitter',
  enabled = true,
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').setup({
      ensure_install = {
        'lua',
        'typescript',
        'regex',
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      }
    })
  end,
}
