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
  {
    "neovim/nvim-lspconfig"
  },

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

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter"
    }
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
    "mrcjkb/rustaceanvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter"
    },
    version = "^4",
    ft = { "rust" },
  },

  -- Color schemes
  { "sainnhe/sonokai", lazy = true },
}

local lazy_opts = {}

require('lazy').setup(plugin_specs, lazy_opts)

