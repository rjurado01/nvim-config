return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end
  },

  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { 'ts_ls', 'eslint' },
      })
    end
  },

  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    config = function()
      require('mason-tool-installer').setup {
        ensure_installed = {
          'eslint_d'
        }
      }
    end
  },

  {
    'neovim/nvim-lspconfig',
    config = function()
      local lsconfig = require('lspconfig')

      -- lsconfig.ts_ls.setup({})
      lsconfig.eslint.setup({})

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client then
            -- desactiva el resaltado de sintaxis del lsp (dejamos el de treesitter)
            client.server_capabilities.semanticTokensProvider = nil

            -- desactiva el resaltado de la palabra actual
            client.server_capabilities.documentHighlightProvider = nil
          end
        end
      })
    end
  },
}
