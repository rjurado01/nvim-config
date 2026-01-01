return  {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    preset = 'helix',

    -- Desactivar en modo terminal
    -- para evitar lag al escribir espacio en el terminal
    -- disable = {
    --   ft = {},
    --   bt = { "terminal" },
    -- },

    spec = {
      {
        mode = { "n", "v" },
        { "<leader>c", group = "Code" },
        { "<leader>g", group = "Git" },
        { "<leader>s", group = "Search" },
        { "g", group = "goto" },
      }
    }
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
    {
      "<leader>c",
      group = "Code"
    }
  },
}
