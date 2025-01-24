-- Tabs
vim.keymap.set('n', '<C-Right>', vim.cmd.tabnext, { noremap = true, silent = true })
vim.keymap.set('n', '<C-Left>', vim.cmd.tabprev, { noremap = true, silent = true })

-- Neo-Tree
vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle<CR>', {desc = 'Neotree'})

-- Other
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename)
-- vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover, { focusable = false }
)

-- Lspsaga
-- vim.keymap.set('n', '<leader>r', '<Cmd>:Lspsaga rename<CR>')
vim.keymap.set({'n', 'v'}, '<leader>a', '<Cmd>:Lspsaga code_action<CR>')
vim.keymap.set({'n', 'v'}, '<leader>A', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>gp', '<Cmd>:Lspsaga peek_definition<CR>')
-- vim.keymap.set('n', '<leader>x', '<Cmd>:Lspsaga finder<CR>')
vim.keymap.set('n', '<leader>t', '<Cmd>:Lspsaga term_toggle<CR>')
-- vim.keymap.set('n', '<leader>k', '<Cmd>:Lspsaga hover_doc<CR>')
vim.keymap.set('n', '<leader>d', '<Cmd>:Lspsaga diagnostic_jump_next<CR>')

vim.keymap.set('n', '<leader>n', function()
  vim.diagnostic.goto_next()

  vim.defer_fn(function()
    vim.lsp.buf.code_action()
  end, 500)
end)

-- Fzf
vim.keymap.set('n', '<leader>f', '<Cmd>:FzfLua files<CR>', {desc = 'Find Files'})
vim.keymap.set('n', '<leader>s', '<Cmd>:FzfLua live_grep<CR>', {desc = 'Search'})
vim.keymap.set('n', '<leader>S', '<Cmd>:FzfLua grep_cword<CR>', {desc = 'Search word under cursor'})
vim.keymap.set('n', '<leader>gs', '<Cmd>:FzfLua git_status<CR>', {desc = 'Git status'})
vim.keymap.set('n', '<leader>ca', '<Cmd>:FzfLua lsp_code_actions<CR>', {desc = 'Git status'})

-- TypescriptTool
vim.keymap.set('n', '<leader>i', function()
  vim.cmd("TSToolsAddMissingImports")

  -- hay que esperar para que ordene los nuevos
  vim.defer_fn(function()
    vim.cmd("TSToolsOrganizeImports")
  end, 500)
end, { desc = 'Fix Imports' })

-- function _G.set_terminal_keymaps()
--   local opts = {buffer = 0}
--   vim.keymap.set('t', '<esc>', [[<Cmd>wincmd k<CR>]], opts)
-- end
--
-- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

vim.api.nvim_set_keymap("n", "<leader>co", ":lua vim.lsp.buf.code_action({ range = { start = { 0, 0 }, ['end'] = { vim.fn.line('$'), 0 } } })<CR>", { noremap = true, silent = true })

