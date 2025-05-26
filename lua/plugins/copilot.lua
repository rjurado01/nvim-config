return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  config = function()
    require("copilot").setup({
      suggestion = { enabled = true },
      panel = { enabled = false },
    })
  end,
}
