vim.g.mapleader = ' '

-- Save
vim.api.nvim_set_keymap('', '<C-s>', ':w<CR>', {nowait = true, silent=true})

-- Buffer/window manipulation
vim.api.nvim_set_keymap('n', '<Tab>', ':BufferLineCycleNext<CR>', {nowait = true, silent=true})
vim.api.nvim_set_keymap('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', {nowait = true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>x', ':bd<CR>', {nowait = true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>q', ':close<CR>', {nowait = true, silent=true})
vim.api.nvim_set_keymap('n', '<leader>s', ':BufferLinePick<CR>', {nowait = true, silent=true})

vim.api.nvim_set_keymap('n', 'gk', 'gg', {nowait = true, silent=true})
vim.api.nvim_set_keymap('n', 'gj', 'G', {nowait = true, silent=true})
vim.api.nvim_set_keymap('n', 'gl', '$', {nowait = true, silent=true})
vim.api.nvim_set_keymap('n', 'gh', '0', {nowait = true, silent=true})

vim.api.nvim_set_keymap('v', 'gk', 'gg', {nowait = true, silent=true})
vim.api.nvim_set_keymap('v', 'gj', 'G', {nowait = true, silent=true})
vim.api.nvim_set_keymap('v', 'gl', '$', {nowait = true, silent=true})
vim.api.nvim_set_keymap('v', 'gh', '0', {nowait = true, silent=true})

-- FZF
vim.api.nvim_set_keymap('n', '<leader>ff',
    "<cmd>lua require('fzf-lua').files()<CR>",
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>fh',
    "<cmd>lua require('fzf-lua').oldfiles()<CR>",
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>fg',
    "<cmd>lua require('fzf-lua').lgrep_curbuf()<CR>",
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>fl',
    "<cmd>lua require('fzf-lua').live_grep()<CR>",
    { noremap = true, silent = true })

-- LSPCONFIG
vim.api.nvim_set_keymap('n', 'K',
    "<cmd>lua vim.lsp.buf.hover()<CR>",
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<c-]>',
    "<cmd>lua vim.lsp.buf.definition()<CR>",
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'gD',
    "<cmd>lua vim.lsp.buf.implementation()<CR>",
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<c-k>',
    "<cmd>lua vim.lsp.buf.signature_help()<CR>",
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'gr',
    "<cmd>lua vim.lsp.buf.references()<CR>",
    { noremap = true, silent = true })

--nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
--nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
--nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
--nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
--nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
