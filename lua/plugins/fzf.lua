return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  enabled = false,
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  opts = {
    fzf_opts = {
      ['--exact'] = true,
    },
    winopts = {
      height = 0.9,
      width = 0.9,
      preview = {
        layout = "vertical",
        vertical = "down:70%",
      },
    },
  }
}
