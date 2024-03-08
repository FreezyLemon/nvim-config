local keymap = vim.keymap
local api = vim.api
local uv = vim.loop

-- telescope
local ts_builtins = require('telescope.builtin')
keymap.set('n', '<leader>ff', ts_builtins.find_files, {})
keymap.set('n', '<leader>fg', ts_builtins.live_grep, {})
keymap.set('n', '<leader>fb', ts_builtins.buffers, {})
keymap.set('n', '<leader>fh', ts_builtins.help_tags, {})

-- Place for future keymaps

