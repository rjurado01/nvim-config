return {
  'akinsho/toggleterm.nvim',
  version = '*',
  enabled = false,
  config = function()
    -- Definir terminales con nombre y atajo
    local terminals = {
      { name = 'main', key = '<leader>t1', desc = 'Terminal principal' },
      { name = 'server', key = '<leader>t2', desc = 'Terminal servidor' },
      { name = 'git', key = '<leader>t3', desc = 'Terminal git' },
      { name = 'aux', key = '<leader>t4', desc = 'Terminal auxiliar' },
    }

    -- Función para generar el título
    local function get_terminal_title(current_name)
      return ' ' .. current_name .. ' '
    end

    require('toggleterm').setup({
      size = function(term)
        if term.direction == 'horizontal' then
          return 15
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.4
        else
          return 20
        end
      end,
      direction = 'float',
      float_opts = {
        border = 'curved',
        width = function() return math.floor(vim.o.columns * 0.8) end,
        height = function() return math.floor(vim.o.lines * 0.8) end,
        title_pos = 'center',
      },
      winbar = {
        enabled = false,
      },
    })

    local Terminal = require('toggleterm.terminal').Terminal

    -- Almacenar instancias de terminales
    local term_instances = {}

    -- Función para obtener la terminal actual
    local function get_current_term()
      for _, term in pairs(term_instances) do
        if term:is_open() then
          return term
        end
      end
      return nil
    end

    -- Función para abrir terminal con título actualizado
    local function open_term(name)
      local term = term_instances[name]
      term.float_opts.title = get_terminal_title(name)
      term:open()
      vim.defer_fn(function()
        vim.cmd('startinsert')
      end, 10)
    end

    -- Crear instancias de terminales
    for i, term in ipairs(terminals) do
      term_instances[term.name] = Terminal:new({
        display_name = term.name,
        direction = 'float',
        count = i + 10,
        float_opts = {
          title = get_terminal_title(term.name),
        },
      })
    end

    -- Crear keymaps para cada terminal
    for i, term in ipairs(terminals) do
      -- Solo modo normal usa leader
      vim.keymap.set('n', term.key, function()
        open_term(term.name)
      end, { desc = term.desc })

      -- Modo terminal usa Ctrl+número
      vim.keymap.set('t', '<C-' .. i .. '>', function()
        local current = get_current_term()
        if current then current:close() end
        open_term(term.name)
      end, { desc = term.desc })
    end

    -- Función para navegar entre terminales
    local function navigate_terms(direction)
      local current = get_current_term()
      if not current then return end

      local names = {}
      for _, t in ipairs(terminals) do
        table.insert(names, t.name)
      end

      local current_idx = 1
      for i, name in ipairs(names) do
        if current.display_name == name then
          current_idx = i
          break
        end
      end

      local next_idx
      if direction == 'next' then
        next_idx = current_idx % #names + 1
      else
        next_idx = (current_idx - 2) % #names + 1
      end

      current:close()
      open_term(names[next_idx])
    end

    -- Atajos generales
    vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm<cr>', { desc = 'Toggle última terminal' })
    vim.keymap.set('n', '<leader>tn', function()
      local new_term = Terminal:new({ direction = 'float' })
      new_term:toggle()
    end, { desc = 'Nueva terminal' })
    vim.keymap.set('n', '<leader>tk', function()
      local current = get_current_term()
      if current then current:shutdown() end
    end, { desc = 'Cerrar terminal' })
    vim.keymap.set('n', '<leader>t]', function() navigate_terms('next') end, { desc = 'Siguiente terminal' })
    vim.keymap.set('n', '<leader>t[', function() navigate_terms('prev') end, { desc = 'Terminal anterior' })

    -- Atajos dentro de la terminal (modo terminal e insert)
    vim.keymap.set('t', '<Esc><Esc>', '<cmd>ToggleTerm<cr>', { desc = 'Cerrar terminal' })
    vim.keymap.set('t', '<C-j>', function() navigate_terms('next') end, { desc = 'Siguiente terminal' })
    vim.keymap.set('t', '<C-k>', function() navigate_terms('prev') end, { desc = 'Terminal anterior' })
    vim.keymap.set('t', '<C-t>', '<cmd>ToggleTerm<cr>', { desc = 'Toggle terminal' })

    -- Cambiar dirección de la terminal
    local function set_direction(direction)
      local current = get_current_term()
      if not current then return end
      current:close()
      current.direction = direction
      current:open()
      vim.defer_fn(function()
        vim.cmd('startinsert')
      end, 10)
    end

    vim.keymap.set('t', '<C-f>', function() set_direction('float') end, { desc = 'Terminal flotante' })
    vim.keymap.set('t', '<C-v>', function() set_direction('vertical') end, { desc = 'Terminal vertical' })

    -- Atajos en modo normal dentro del buffer de terminal
    vim.api.nvim_create_autocmd('TermOpen', {
      callback = function()
        local opts = { buffer = 0 }
        vim.keymap.set('n', '<Esc>', '<cmd>ToggleTerm<cr>', vim.tbl_extend('force', opts, { desc = 'Cerrar terminal' }))
        vim.keymap.set('n', 'q', '<cmd>ToggleTerm<cr>', vim.tbl_extend('force', opts, { desc = 'Cerrar terminal' }))
      end,
    })

    -- Deshabilitar which-key en modo terminal para evitar lag
    vim.api.nvim_create_autocmd('TermEnter', {
      callback = function()
        vim.b.which_key_disable = true
      end,
    })
  end
}
