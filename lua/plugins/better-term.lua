return {
  'CRAG666/betterTerm.nvim',
  enabled = false,
  keys = {
    {
      '<leader>t1',
      function()
        require('betterTerm').open(1)
      end,
      desc = 'Open BetterTerm 1 (Main)',
    },
    {
      '<leader>t2',
      function()
        require('betterTerm').open(2)
      end,
      desc = 'Open BetterTerm 2 (Server)',
    },
    {
      '<leader>tt',
      function()
        require('betterTerm').select()
      end,
      desc = 'Select terminal',
    },
    {
      '<leader>tr',
      function()
        require('betterTerm').rename()
      end,
      desc = 'Rename terminal',
    },
    {
      mode = { 'n', 't' },
      '<Esc><Esc>',
      function()
        vim.api.nvim_win_hide(0)
      end,
      desc = 'Hide terminal',
    },
  },
  opts = {
    -- position = 'vert',
    -- size = math.floor(vim.o.columns / 2),
    size = 35,
    jump_tab_mapping = "<A-$tab>",
    predefined = {
      { index = 1, name = "Editor" },
      { index = 2, name = "Debug" },
      { index = 3, name = "Server" },
    },
  },
}
