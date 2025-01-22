return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    opts = {
      -- sources = { "filesystem", "buffers", "git_status" },
      -- open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
    },
    config = function(_, opts)
      require("neo-tree").setup(opts)

      -- hacemos que aparezca abierto por defecto
      -- https://github.com/AstroNvim/AstroNvim/issues/648
      -- vim.api.nvim_create_augroup("neotree_autoopen", { clear = true })
      -- vim.api.nvim_create_autocmd("BufRead", { -- Changed from BufReadPre
      --   desc = "Open neo-tree on enter",
      --   group = "neotree_autoopen",
      --   once = true,
      --   callback = function()
      --     if not vim.g.neotree_opened then
      --       vim.cmd "Neotree show"
      --       vim.g.neotree_opened = true
      --     end
      --   end,
      -- })
    end,
  }
}
