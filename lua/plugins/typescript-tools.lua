return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  enabled = true,
  config = true,
  opts = {
    settings = {
      tsserver_file_preferences = {
        -- https://github.com/pmizio/typescript-tools.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
        importModuleSpecifierPreference = 'project-relative',
      }
    }
  }
  -- opts = {
  --   server = {
  --     cmd = { "typescript-language-server", "--log", "verbose" },
  --   },
  --   handlers = {
  --     ["textDocument/hover"] = vim.lsp.with(function()
  --       print("test")
  --     end, {
  --       silent = true,
  --     }),
  --   },
  --   settings = {
  --     expose_as_code_action = {'add_missing_imports'},
  --   },
  -- },
  -- config = function(opts)
  --   require("typescript-tools").setup(opts)
  --
  --   vim.lsp.handlers["textDocument/codeAction"] = function(err, result, ctx)
  --     local opts = { border = "rounded" }
  --     vim.lsp.util.show_code_actions(result, opts)
  --   end
  -- end,
}
