local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.setup({
  server_filetype_map = {
    typescript = {'typescript'},
    cssls = {'scss','css','less'},
  },
  symbol_in_winbar = {
    enable = false
  },
  lightbulb = {
    enabled = true,
    virtual_text = false
  },
  finder= {
    default= 'def+ref',
    methods = {
      def = 'textDocument/definition',
    }
  }
})

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga finder<CR>', opts)
vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
vim.keymap.set('n', 'ga', '<Cmd>Lspsaga code_action<CR>', opts)
vim.keymap.set('n', 'gt', '<Cmd>Lspsaga term_toggle<CR>', opts)

