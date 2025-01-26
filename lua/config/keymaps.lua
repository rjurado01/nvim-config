-- Tabs
vim.keymap.set('n', '<C-Right>', vim.cmd.tabnext, { noremap = true, silent = true })
vim.keymap.set('n', '<C-Left>', vim.cmd.tabprev, { noremap = true, silent = true })

-- Lspsaga
-- vim.keymap.set('n', '<leader>r', '<Cmd>:Lspsaga rename<CR>')
-- vim.keymap.set({'n', 'v'}, '<leader>a', '<Cmd>:Lspsaga code_action<CR>')
-- vim.keymap.set({'n', 'v'}, '<leader>A', vim.lsp.buf.code_action)
-- vim.keymap.set('n', '<leader>gp', '<Cmd>:Lspsaga peek_definition<CR>')
-- vim.keymap.set('n', '<leader>x', '<Cmd>:Lspsaga finder<CR>')
-- vim.keymap.set('n', '<leader>k', '<Cmd>:Lspsaga hover_doc<CR>')

-- Tools
vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>', {desc = 'Neotree'})
vim.keymap.set('n', '<leader>t', '<Cmd>:Lspsaga term_toggle<CR>', {desc = 'Term'})
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {desc = 'Rename'})

-- Search
vim.keymap.set('n', '<leader>sf', '<Cmd>:FzfLua files<CR>', {desc = 'Files'})
vim.keymap.set('n', '<leader>sg', '<Cmd>:FzfLua live_grep<CR>', {desc = 'Grep'})
vim.keymap.set('n', '<leader>sG', '<Cmd>:FzfLua grep_cword<CR>', {desc = 'Word under cursor'})
vim.keymap.set('n', '<leader>sd', '<Cmd>:FzfLua lsp_definitions<CR>', {desc = 'Definitions'})
vim.keymap.set('n', '<leader>si', '<Cmd>:FzfLua lsp_implementations<CR>', {desc = 'Definitions'})
vim.keymap.set('n', '<leader>st', '<Cmd>:FzfLua tabs<CR>', {desc = 'Tabs'})
vim.keymap.set('n', '<leader>sb', '<Cmd>:FzfLua buffers<CR>', {desc = 'Buffers'})

-- Git
vim.keymap.set('n', '<leader>gs', '<Cmd>:FzfLua git_status<CR>', {desc = 'Git status'})
vim.keymap.set('n', '<leader>gb', '<Cmd>:FzfLua git_blame<CR>', {desc = 'Git blame'})

-- Code
vim.keymap.set('n', '<leader>ca', '<Cmd>:FzfLua lsp_code_actions<CR>', {desc = 'Code actions'})
vim.keymap.set('n', '<leader>cp', '<Cmd>:Lspsaga peek_definition<CR>', {desc = 'Peek definition'})
vim.keymap.set('n', '<leader>ci', '<Cmd>:TSToolsAddMissingImports<CR>', {desc = 'Add missing imports'})
vim.keymap.set('n', '<leader>co', '<Cmd>:TSToolsOrganizeImports<CR>', {desc = 'Organize imports'})
vim.keymap.set('n', '<leader>cd', '<Cmd>:Lspsaga diagnostic_jump_next<CR>', {desc = 'Jump diagnostic'})
vim.keymap.set('n', '<leader>ce', '<Cmd>:EslintFixAll<CR>', {desc = 'EslintFixAll'})
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, {desc = 'Rename'})

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
