return {
  "yetone/avante.nvim",
  enabled = false,
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  mode = "legacy",
  opts = {
    -- provider: "copilot",
    providers = {
      copilot = {
        -- model = "gpt-4.1",
        -- model = "gemini-2.5-pro",
        -- model = "claude-sonnet-4.5",
        -- model = "gpt-5-codex",
        model = 'claude-haiku-4.5'
      },
      gemini = {
        -- model = "gemini-2.5-flash",
        model = "gemini-2.5-pro",
      },
    },
    acp_providers = {
      ["gemini-cli"] = {
        command = "gemini",
        args = {
          "--experimental-acp",
          "--model", "gemini-2.5-pro",
          "--allowed-tools", "ShellTool(git),ShellTool(ps)",
        },
        env = {
          NODE_NO_WARNINGS = "1",
          GEMINI_API_KEY = os.getenv("GEMINI_API_KEY"),
        },
        auth_method = "gemini-api-key",
      },
    },
    input = {
      provider = "snacks",
      provider_opts = {
        -- Additional snacks.input options
        title = "Avante Input",
        icon = " ",
      },
    },
  },
  config = function(_, opts)
    require("avante").setup(opts)

    vim.defer_fn(function()
      -- vim.cmd("AvanteSwitchProvider gemini")
      -- vim.cmd("AvanteSwitchSelectorProvider snacks")
    end, 200)
  end,
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua",
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      enabled = false, -- Desactivar el plugin
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
