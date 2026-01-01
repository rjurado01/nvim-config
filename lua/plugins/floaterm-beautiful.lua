-- Función para cambiar tamaño del floaterm dinámicamente
local function resize_floaterm(h, w)
  local state = require("floaterm.state")
  state.config.size = { h = h, w = w }
  -- Cerrar y reabrir para aplicar el nuevo tamaño
  if state.volt_set then
    require("floaterm").toggle()
    require("floaterm").toggle()
  end
end

-- Función para cambiar posición del floaterm
local function reposition_floaterm(row, col)
  local state = require("floaterm.state")
  state.config.position = { row = row, col = col }
  if state.volt_set then
    require("floaterm").toggle()
    require("floaterm").toggle()
  end
end

return {
  "nvzone/floaterm",
  dependencies = "nvzone/volt",
  enabled = false,
  cmd = "FloatermToggle",
  keys = {
    -- Tamaños predefinidos
    { "<leader>fM", function() resize_floaterm(95, 95) end, desc = "Floaterm maximizar" },
    { "<leader>fN", function() resize_floaterm(85, 85) end, desc = "Floaterm normal" },
    { "<leader>fS", function() resize_floaterm(50, 60) end, desc = "Floaterm pequeño" },
    -- Aumentar/reducir tamaño
    { "<leader>f+", function()
      local state = require("floaterm.state")
      local h = math.min(98, state.config.size.h + 5)
      local w = math.min(98, state.config.size.w + 5)
      resize_floaterm(h, w)
    end, desc = "Floaterm +tamaño" },
    { "<leader>f-", function()
      local state = require("floaterm.state")
      local h = math.max(30, state.config.size.h - 5)
      local w = math.max(30, state.config.size.w - 5)
      resize_floaterm(h, w)
    end, desc = "Floaterm -tamaño" },
    -- Posiciones
    { "<leader>fc", function() reposition_floaterm(nil, nil) end, desc = "Floaterm centrar" },
    { "<leader>fh", function() reposition_floaterm(5, 5) end, desc = "Floaterm arriba-izq" },
  },
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
  mappings = {
    term = function(buf)
      print("Setting floaterm mappings for buffer ")

      vim.keymap.set("n", "<ESC>", function()
        require("floaterm").toggle()
      end, { buffer = buf })
    end,
  },
}    
