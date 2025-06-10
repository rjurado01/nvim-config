return {
  "zaldih/themery.nvim",
  lazy = false,
  config = function()
    require("themery").setup({
      themes = {
        -- "onedark",
        "apprentice",
        "OceanicNext",
        -- "duskfox",
        "nightfox",
        "catppuccin-macchiato",
        "rose-pine-moon",
        -- "rose-pine",
        -- "rose-pine-dawn",
        -- "monokai-pro-classic",
        -- "tokyonight-night",
        -- "tokyonight-storm",
        -- "tokyonight-moon",
        -- "catppuccin-latte",
        -- "catppuccin-frappe",
        -- "catppuccin-mocha",
        -- "oldtale",
        -- "sonokai",
        -- "rasmus",
        -- "monokai-pro-default",
        -- "monokai-pro-machine",
        -- "monokai-pro-octagon",
        -- "monokai-pro-ristretto",
        -- "monokai-pro-spectrum",
        -- "no-clown-fiesta",
        -- "embark",
        -- "juliana",
      },
      preview = true,
    })
  end
}
