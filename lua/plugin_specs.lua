-- Install lazy, if it doesn't exist
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugin_specs = {
  -- Autocompletions
  {
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "onsails/lspkind-nvim",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "SirVer/ultisnips",
    },
    config = function()
      require("config.nvim-cmp")
    end,
  },

  -- Debug Adapter Protocol (DAP)
  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      require("config.nvim-dap")
    end,
  },

  -- Rust tools
  {
    "simrat39/rust-tools.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" },
    config = function(_, _)
      local rt = require("rust-tools")

      rt.setup({
        hover_actions = {
          auto_focus = true,
        },
        server = {
          on_attach = function(_, bufnr)
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
          end,
        },
      })
    end,
    ft = { "rust", "rs" },
  },

  -- Color schemes
  { "sainnhe/sonokai", lazy = true },
}

local lazy_opts = {}

require('lazy').setup(plugin_specs, lazy_opts)

