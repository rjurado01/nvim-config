return {
  {'tpope/vim-fugitive', lazy = true},

  -- https://github.com/sindrets/diffview.nvim#configuration
  {
    'sindrets/diffview.nvim',
    cmd = 'DiffviewOpen',
  },

  {
    'lewis6991/gitsigns.nvim',
    cmd = 'Gitsigns',
    config = true
  },
}
