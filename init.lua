-- Inspired by jdhao's nvim-config repository

local version = vim.version

local core_conf_files = {
  "globals.lua", -- global settings
  "options.vim", -- setting options in nvim
  "autocommands.vim", -- various autocommands
  "plugins.vim", -- installed plugins and their configs
  "colorschemes.lua", -- color scheme settings
  "mappings.lua", -- user-defined mappings
}

local viml_conf_dir = vim.fn.stdpath("config") .. "/viml_conf"
-- source all core_conf files
for _, file_name in ipairs(core_conf_files) do
  if vim.endswith(file_name, 'vim') then
    local path = string.format("%s/%s", viml_conf_dir, file_name)
    local source_cmd = "source " .. path
    vim.cmd(source_cmd)
  else
    local module_name, _ = string.gsub(file_name, "%.lua", "")
    package.loaded[module_name] = nil
    require(module_name)
  end
end
