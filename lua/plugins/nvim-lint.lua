-- https://www.josean.com/posts/neovim-linting-and-formatting
return {
  'mfussenegger/nvim-lint',
  config = function()
    require('lint').linters_by_ft = {
      javascript = { 'eslint_d' },
      typescript = {'eslint_d'},
    }

    vim.api.nvim_create_autocmd({ 'BufEnter', 'InsertLeave', 'TextChanged' }, {
      callback = function()
        require('lint').try_lint()
      end,
    })
  end
}
