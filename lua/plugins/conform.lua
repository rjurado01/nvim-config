return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      typescript = { 'eslint_d', 'prettier' },
    },
    format_on_save = {
      timeout_ms = 1000,
      lsp_format = "fallback",
    },
    formatters = {
      eslint_d = {
        command = "eslint_d",
        args = { "--fix-to-stdout", "--stdin", "--stdin-filename", "$FILENAME" },
        stdin = true,
      },
    },
    config = function(_, opts)
      require('conform').setup(opts)
    end
  },
}
