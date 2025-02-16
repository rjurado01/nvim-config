return {
  "zaldih/themery.nvim",
  lazy = false,
  config = function()
    require("themery").setup({
      themes = {
        "onedark",
        "apprentice",
        "tokyonight-night",
        "tokyonight-storm",
        "tokyonight-moon",
        "catppuccin-latte",
        "catppuccin-frappe",
        "catppuccin-macchiato",
        "catppuccin-mocha",
        "oldtale",
        "sonokai",
        "rasmus",
        "rose-pine",
        "rose-pine-moon",
        -- "rose-pine-dawn",
        "nordfox",
        "monokai-pro-classic",
        "monokai-pro-default",
        "monokai-pro-machine",
        "monokai-pro-octagon",
        "monokai-pro-ristretto",
        "monokai-pro-spectrum",
        "no-clown-fiesta",
      },
      preview = true,
    })
  end
}
