local keymap = vim.keymap
local api = vim.api
local uv = vim.loop

-- Generic LSP mappings
local lspconfig = require('lspconfig')
api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- enable completion by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- buffer local mappings
    local opts = { buffer = ev.buf }
    keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

-- telescope
local ts_builtins = require('telescope.builtin')
keymap.set('n', '<leader>ff', ts_builtins.find_files, {})
keymap.set('n', '<leader>fg', ts_builtins.live_grep, {})
keymap.set('n', '<leader>fb', ts_builtins.buffers, {})
keymap.set('n', '<leader>fh', ts_builtins.help_tags, {})

-- Place for future keymaps

