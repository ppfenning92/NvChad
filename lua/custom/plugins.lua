local plugins = {
  -- {
  --   "mfussenegger/nvim-lint",
  --   event = "VeryLazy",
  --   config = function ()
  --     require "custom.configs.lint"
  --   end
  -- },
  -- {
  --   "mhartington/formatter.nvim",
  --   event = "VeryLazy",
  --   opts = function ()
  --     return require "custom.configs.formatter"
  --   end
  -- },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function ()
      return require "custom.configs.null-ls"
    end,
  },
  {"williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "eslint-lsp",
        "prettier",
        "lua-language-server",

        "rust-analyzer"
      }
    }
  },
  {"mfussenegger/nvim-ansible"},
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end
  }
}
return plugins
