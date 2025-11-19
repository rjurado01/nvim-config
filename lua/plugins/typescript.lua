return {
  {
    'dmmulroy/tsc.nvim',
    enabled = false,
  },

  {
    'dmmulroy/ts-error-translator.nvim',
    enabled = false,
    config = function()
      require('ts-error-translator').setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })

      vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx)
        require("ts-error-translator").translate_diagnostics(err, result, ctx)
        vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx)
      end
    end
  }
}
