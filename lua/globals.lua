local fn = vim.fn
local api = vim.api

----------------------
-- Custom variables --
----------------------

vim.g.logging_level = "info"


--------------
-- Builtins --
--------------

-- Disable built-in providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

-- Set en_US as main language
vim.cmd [[language en_US.UTF-8]]

