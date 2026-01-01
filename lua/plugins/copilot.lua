return {
  "zbirenbaum/copilot.lua",
  dependencies = {
    {
      "copilotlsp-nvim/copilot-lsp",
      init = function()
        -- vim.g.copilot_nes_debounce = 200
      end,
    },
  },
  event = "InsertEnter",
  build = ":Copilot auth",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<S-Tab>",
          accept_word = "<C-Right>",
          accept_line = "<C-Down>",
          dismiss = "<C-e>",
        },
      },
      nes = {
        enabled = false,
        keymap = {
          accept_and_goto = "<Tab>",
          accept = false,
          dismiss = "<Esc>",
        },
      },
      panel = { enabled = false },
    })
  end,
}
