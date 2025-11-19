return {
  "NickvanDyke/opencode.nvim",
  config = function()
    vim.g.opencode_opts = {
      prompts = {},
      provider = {
        enabled = "snacks",
      }
    }

    -- Required for `opts.auto_reload`.
    -- vim.o.autoread = true
  end,
}
