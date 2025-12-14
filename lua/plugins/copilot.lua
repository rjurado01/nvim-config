return {
  "zbirenbaum/copilot.lua",
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
          next = "<C-j>",
          prev = "<C-k>",
          dismiss = "<C-e>",
        },
      },
      panel = { enabled = false },
    })
  end,
}
