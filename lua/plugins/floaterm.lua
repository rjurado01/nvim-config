-- return {
--   'voldikss/vim-floaterm',
--   config = function()
--     vim.g.floaterm_width = 0.8
--     vim.g.floaterm_height = 0.8
--   end
-- }

return {
  "nvzone/floaterm",
  dependencies = "nvzone/volt",
  opts = {
    size = { h = 85, w = 85 },
    terminals = {
      { name = "Run" },
      { name = "Server" },
      { name = "Opencode" },
      { name = "Docker" },
      { name = "Test" },
    },
  },
  cmd = "FloatermToggle",
}          
