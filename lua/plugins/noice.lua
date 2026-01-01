-- otra opción es find-cmdline

return {
  "folke/noice.nvim",
  enabled = true,
  event = "VeryLazy",
  opts = {
    -- add any options here
    lsp = {
      progress = {
        enabled = true,
      },
      signature = {
        enabled = false,
      },
    },
    cmdline = {
      format = {
        cmdline = { pattern = "^:", icon = ":", lang = "vim" },
      },
    },
    messages = {
      -- NOTE: If you enable messages, then the cmdline is enabled automatically.
      -- This is a current Neovim limitation.
      enabled = true, -- enables the Noice messages UI
    },
    routes = {
      -- https://github.com/folke/noice.nvim/wiki/Configuration-Recipes#hide-search-virtual-text
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true },
      },
    },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    -- "rcarriga/nvim-notify",
  }
}
