-- Tabs
vim.keymap.set('n', '"', vim.cmd.tabnext, { noremap = true, silent = true })
vim.keymap.set('n', '!', vim.cmd.tabprev, { noremap = true, silent = true })

vim.api.nvim_exec([[ cnoreabbrev qt tabclose ]], false)

-- Lspsaga
-- vim.keymap.set('n', '<leader>r', '<Cmd>:Lspsaga rename<CR>')
-- vim.keymap.set({'n', 'v'}, '<leader>a', '<Cmd>:Lspsaga code_action<CR>')
vim.keymap.set({'n', 'v'}, '<leader>A', vim.lsp.buf.code_action)
-- vim.keymap.set('n', '<leader>gp', '<Cmd>:Lspsaga peek_definition<CR>')
-- vim.keymap.set('n', '<leader>x', '<Cmd>:Lspsaga finder<CR>')
vim.keymap.set('n', '<leader>k', '<Cmd>:Lspsaga hover_doc<CR>')

-- Tools
vim.keymap.set('n', '<leader>e', '<Cmd>lua Snacks.explorer()<CR>', {desc = 'Neotree'})
-- vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>', {desc = 'Neotree'})
vim.keymap.set('n', '<leader>t', '<Cmd>:FloatermToggle<CR>', {desc = 'Term'})
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {desc = 'Rename'})
vim.keymap.set("n", "<leader>q", '<Cmd>q<CR>', {desc = 'Quit'})
vim.keymap.set("n", "<leader>Q", '<Cmd>:tabclose<CR>', {desc = 'Tabclose'})
vim.keymap.set("n", "<leader>w", '<Cmd>w<CR>', {desc = 'Save'})
vim.keymap.set('n', '<leader>a', '<Cmd>:Lspsaga diagnostic_jump_next<CR>', {desc = 'Jump diagnostic'})
vim.keymap.set("n", "sa", '<Cmd>:Surround<CR>', {noremap = true, silent = true, desc = 'Save'})
vim.keymap.set('n', '<leader>f', '<Cmd>:FzfLua files<CR>', {desc = 'Find Files'})
vim.keymap.set('n', '<leader>l', '<Cmd>:Lazy<CR>', {desc = 'Lazy'})
vim.keymap.set('n', '<leader>p', '<Cmd>:Lspsaga peek_definition<CR>', {desc = 'Peek definition'})
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, {desc = 'Open float diagnostic'})
vim.keymap.set('n', '<leader>ñ', '<Cmd>Themery<CR>', {desc = 'Themery'})
vim.keymap.set('n', '<leader>Ñ', '<Cmd>lua Snacks.picker.colorschemes()<CR>', {desc = 'Themery'})

vim.keymap.set('n', '<tab>', '<C-w>', {desc = 'Window'})

vim.keymap.set("n", "<leader>gv", function()
  vim.cmd("vsplit") -- Abre un vsplit
  vim.lsp.buf.definition() -- Salta a la definición en la nueva ventana
end, { noremap = true, silent = true, desc = "Goto definition vsplit" })

vim.keymap.set("n", "<leader>gt", function()
  local pos = vim.api.nvim_win_get_cursor(0) -- Guarda la posición actual
  vim.lsp.buf.definition() -- Salta a la definición en la misma ventana
  local new_file = vim.api.nvim_buf_get_name(0) -- Obtiene el nombre del nuevo archivo

  if new_file ~= "" then
    vim.cmd("tabedit " .. new_file) -- Si hay un archivo, lo abre en una nueva pestaña
    vim.api.nvim_win_set_cursor(0, pos) -- Mantiene la posición del cursor
  end
end, { noremap = true, silent = true, desc = 'Goto definition tabnew' })

vim.api.nvim_create_user_command("Surround", function()
  local keys = vim.api.nvim_replace_termcodes("viw", true, false, true)
  vim.api.nvim_feedkeys(keys, "n", false)

  local keys = vim.api.nvim_replace_termcodes("sa", true, false, true)
  vim.api.nvim_feedkeys(keys, "v", false)
end, {})

-- Term
vim.keymap.set('t', '<esc>', '<C-\\><C-n>:FloatermToggle<CR>', {noremap = true, silent = true})

-- Search
vim.keymap.set('n', '<leader>sf', '<Cmd>lua Snacks.picker.files()<CR>', {desc = 'Files'})
vim.keymap.set('n', '<leader>sg', '<Cmd>lua Snacks.picker.grep()<CR>', {desc = 'Grep'})
vim.keymap.set('n', '<leader>sG', '<Cmd>:FzfLua grep_cword<CR>', {desc = 'Word under cursor'})
vim.keymap.set('n', '<leader>sd', '<Cmd>:FzfLua lsp_definitions<CR>', {desc = 'Definitions'})
vim.keymap.set('n', '<leader>si', '<Cmd>:FzfLua lsp_implementations<CR>', {desc = 'Definitions'})
vim.keymap.set('n', '<leader>st', '<Cmd>:FzfLua tabs<CR>', {desc = 'Tabs'})
vim.keymap.set('n', '<leader>sb', '<Cmd>:FzfLua buffers<CR>', {desc = 'Buffers'})

-- Git
vim.keymap.set('n', '<leader>gs', '<Cmd>:FzfLua git_status<CR>', {desc = 'Git status'})
vim.keymap.set('n', '<leader>gb', '<Cmd>:Gitsigns blame<CR>', {desc = 'Git blame'})
-- vim.keymap.set('n', '<leader>gb', '<Cmd>:Git blame<CR>', {desc = 'Git blame'})
vim.keymap.set('n', '<leader>gc', '<Cmd>:DiffviewOpen<CR>', {desc = 'Git changes'})

-- Code
vim.keymap.set('n', '<leader>ca', '<Cmd>:Lspsaga code_action<CR>', {desc = 'Code actions'})
vim.keymap.set('n', '<leader>cp', '<Cmd>:Lspsaga peek_definition<CR>', {desc = 'Peek definition'})
vim.keymap.set('n', '<leader>ci', '<Cmd>:TSToolsAddMissingImports<CR>', {desc = 'Add missing imports'})
vim.keymap.set('n', '<leader>co', '<Cmd>:TSToolsOrganizeImports<CR>', {desc = 'Organize imports'})
vim.keymap.set('n', '<leader>cj', '<Cmd>:Lspsaga diagnostic_jump_next<CR>', {desc = 'Jump diagnostic'})
vim.keymap.set('n', '<leader>ce', '<Cmd>:EslintFixAll<CR>', {desc = 'EslintFixAll'})
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, {desc = 'Rename'})
vim.keymap.set('n', '<Leader>cs', vim.lsp.buf.signature_help, {desc = 'Toggle signature' })
vim.keymap.set('n', '<leader>cd', '<Cmd>:Lspsaga show_line_diagnostics<CR>', {desc = 'Open float diagnostic'})
vim.keymap.set('n', '<leader>ct', '<cmd>tab split | lua vim.lsp.buf.definition()<CR>', {})
vim.keymap.set('n', '<leader>cv', '<cmd>vsplit | lua vim.lsp.buf.implementation()<CR>', {})
vim.keymap.set('n', '<leader>cg', '<cmd>lua vim.lsp.buf.implementation()<CR>', {})

-- TypescriptTool
vim.keymap.set('n', '<leader>i', function()
  vim.cmd("TSToolsAddMissingImports")

  -- hay que esperar para que ordene los nuevos
  vim.defer_fn(function()
    vim.cmd("TSToolsOrganizeImports")
  end, 500)
end, { desc = 'Fix Imports' })

-- Terminal
-- function _G.set_terminal_keymaps()
--   local opts = {buffer = 0}
--   vim.keymap.set('t', '<esc>', [[<Cmd>wincmd k<CR>]], opts)
-- end
--
-- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Notas
-- bve: seleciona la palabra actual
-- viw: seleciona la palabra actual
-- ciw: borra la palabra actual y deja insert
