-- Lazy install nvim-treesitter
return { 
  'nvim-treesitter/nvim-treesitter',
  enabled = true,
  build = ':TSUpdate',
  event = 'VeryLazy',
  main = 'nvim-treesitter.configs',
  opts = {
    ensure_installed = {
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
  },
}
