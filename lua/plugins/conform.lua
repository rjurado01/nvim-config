return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      typescript = { 'prettier', 'eslint_d' },
    },
    format_on_save = {
      timeout_ms = 1000,
      lsp_format = "fallback",
    },
    config = function(_, opts)
      require('conform').setup(opts)

      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("EslintFixAll", { clear = true }),
        pattern = { "*.ts", "*.js" },
        command = "silent! EslintFixAll",
      })
    end
  },
}
