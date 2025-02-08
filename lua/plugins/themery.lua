return {
  "zaldih/themery.nvim",
  lazy = false,
  config = function()
    require("themery").setup({
      themes = {
        "onedark",
        "apprentice",
        "tokyonight-night",
        -- "tokyonight-storm",
        "tokyonight-moon",
        "oldtale",
        "sonokai",
        "rasmus",
        "rose-pine",
        "rose-pine-moon",
        -- "rose-pine-dawn",
        "nordfox",
      },
      preview = true,
    })
  end
}
