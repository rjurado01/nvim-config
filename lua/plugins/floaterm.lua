return {
  'voldikss/vim-floaterm',
  enabled = true,
  config = function()
    -- Configuración global
    vim.g.floaterm_width = 0.85
    vim.g.floaterm_height = 0.85
    vim.g.floaterm_title = '$1/$2'
    vim.g.floaterm_autoinsert = true
    vim.g.floaterm_position = 'center'
    vim.g.floaterm_titleposition = 'center'

    -- Fondo más oscuro para la terminal
    vim.api.nvim_set_hl(0, 'FloatermBorder', { bg = '#131a24', fg = '#5c6370' })
    vim.api.nvim_set_hl(0, 'Floaterm', { bg = '#131a24' })

    -- Definir terminales con nombre
    local terminals = {
      { name = 'Term', key = 't', desc = 'Term' },
      { name = 'Server', key = 's', desc = 'Servidor' },
      { name = 'AI', key = 'a', desc = 'AI', cmd = 'opencode' },
    }

    -- Función para abrir o toggle una terminal por nombre
    local function toggle_term(name, cmd)
      local bufnr = vim.fn['floaterm#terminal#get_bufnr'](name)

      if bufnr == -1 then
        local command = 'FloatermNew --name=' .. name .. ' --title=' .. name .. '\\ $1/$2'

        if cmd then
          command = command .. ' ' .. cmd
        end

        vim.cmd(command)
      else
        vim.cmd('FloatermToggle ' .. name)
      end
    end

    -- Crear keymaps para cada terminal
    for _, term in ipairs(terminals) do
      -- Modo normal: leader + t + número
      vim.keymap.set('n', '<leader>t' .. term.key, function()
        toggle_term(term.name, term.cmd)
      end, { desc = term.desc })

      -- Modo terminal: Ctrl + número
      vim.keymap.set('t', '<C-' .. term.key .. '>', function()
        toggle_term(term.name)
      end, { desc = term.desc })
    end

    -- Atajos generales (modo normal)
    -- vim.keymap.set('n', '<leader>tt', '<cmd>FloatermToggle<cr>', { desc = 'Toggle última terminal' })
    -- vim.keymap.set('n', '<leader>tn', '<cmd>FloatermNew<cr>', { desc = 'Nueva terminal' })
    -- vim.keymap.set('n', '<leader>tk', '<cmd>FloatermKill<cr>', { desc = 'Cerrar terminal' })
    -- vim.keymap.set('n', '<leader>t]', '<cmd>FloatermNext<cr>', { desc = 'Siguiente terminal' })
    -- vim.keymap.set('n', '<leader>t[', '<cmd>FloatermPrev<cr>', { desc = 'Terminal anterior' })

    -- Atajos dentro de la terminal (modo terminal)
    vim.keymap.set('t', '<Esc><Esc>', '<cmd>FloatermToggle<cr>', { desc = 'Cerrar terminal' })

    -- Función para cambiar terminal ocultando la actual primero (evita UI rota)
    local function switch_terminal(direction)
      local current = vim.fn['floaterm#buflist#curr']()
      if current ~= -1 then
        vim.fn['floaterm#window#hide'](current)
      end
      if direction == 'next' then
        vim.cmd('FloatermNext')
      else
        vim.cmd('FloatermPrev')
      end
    end

    vim.keymap.set('t', '<C-j>', function()
      switch_terminal('next')
    end, { desc = 'Siguiente terminal' })

    vim.keymap.set('t', '<C-k>', function()
      switch_terminal('prev')
    end, { desc = 'Terminal anterior' })

    -- Función para actualizar todas las terminales
    local function update_all_terminals(opts)
      local current = vim.fn['floaterm#buflist#curr']()
      local buflist = vim.fn['floaterm#buflist#gather']()

      -- Ocultar todas las terminales primero
      for _, bufnr in ipairs(buflist) do
        pcall(function()
          vim.fn['floaterm#window#hide'](bufnr)
        end)
      end

      -- Actualizar configuración de cada terminal
      for _, bufnr in ipairs(buflist) do
        vim.fn['floaterm#config#set'](bufnr, 'wintype', opts.wintype)
        vim.fn['floaterm#config#set'](bufnr, 'width', opts.width)
        vim.fn['floaterm#config#set'](bufnr, 'height', opts.height)
        if opts.position then
          vim.fn['floaterm#config#set'](bufnr, 'position', opts.position)
        end
      end

      -- Mostrar solo la terminal actual con la nueva configuración
      if current ~= -1 then
        vim.cmd('FloatermToggle')
      end
    end

    -- Cambiar tipo de ventana (afecta a todas las terminales)
    vim.keymap.set('t', '<C-f>', function()
      update_all_terminals({ wintype = 'float', width = 0.85, height = 0.85, position = 'center' })
    end, { desc = 'Terminal flotante (todas)' })

    vim.keymap.set('t', '<C-v>', function()
      update_all_terminals({ wintype = 'vsplit', width = 0.5, height = 1.0 })
    end, { desc = 'Terminal vertical (todas)' })

    -- Atajos en modo normal dentro del buffer de terminal
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'floaterm',
      callback = function()
        local opts = { buffer = true }
        vim.keymap.set('n', '<Esc>', '<cmd>FloatermToggle<cr>', vim.tbl_extend('force', opts, { desc = 'Cerrar terminal' }))
        vim.keymap.set('n', 'q', '<cmd>FloatermToggle<cr>', vim.tbl_extend('force', opts, { desc = 'Cerrar terminal' }))
      end,
    })

    vim.keymap.set({ "n", "x" }, "ga", function()
      -- Capturar el contexto ANTES de abrir la terminal
      local context = require("opencode.context").new()
      local this_ref = context:this()

      -- Abrir/mostrar la terminal con opencode
      toggle_term('AI', 'opencode')

      -- Polling para esperar a que opencode esté listo
      local attempts = 0
      local max_attempts = 20
      local sent = false

      local timer = vim.uv.new_timer()
      timer:start(300, 300, vim.schedule_wrap(function()
        if sent then
          return
        end

        attempts = attempts + 1

        -- Intentar obtener el puerto SIN lanzar otro proceso (launch = false)
        require("opencode.cli.server").get_port(false)
          :next(function()
            if not sent then
              sent = true
              timer:stop()
              timer:close()
              require("opencode").prompt(this_ref)
              context:clear()
            end
          end)
          :catch(function()
            -- Ignorar errores, seguir intentando
          end)

        if attempts >= max_attempts and not sent then
          timer:stop()
          timer:close()
          context:clear()
          vim.notify("Timeout esperando a opencode", vim.log.levels.WARN)
        end
      end))
    end, { desc = "Add to AI" })
  end
}
