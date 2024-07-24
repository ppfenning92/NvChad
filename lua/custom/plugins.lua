local plugins = {
  {

    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "typescript",
        "javascript",
        "html",
        "css",
        "scss",
        "json",
        "yaml",
        "lua",
        "rust",
        "go",
        "python",
        "bash",
        "dockerfile",
        "gleam",
        "markdown",
        "markdown_inline",
        "http",
        "jsonc",
        "toml",
        "jq",
        "ini",
        "make",
        "passwd",
        "prisma",
        "proto",
        "regex",
        "sql",
        "terraform",
        "helm",
        "hcl",
        "git_config",
        "gitignore",
        "gitcommit",
        "angular",
      },
    },
  },
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
    "nvim-tree/nvim-tree.lua",
    -- cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    -- init = function()
    --   require("core.utils").load_mappings "nvimtree"
    -- end,
    opts = {
      view = {
        -- width = 30,
        -- side = "right",
        adaptive_size = true,
      },
    }, -- config = function(_, opts)
    --   dofile(vim.g.base46_cache .. "nvimtree")
    --   require("nvim-tree").setup(opts)
    -- end,
  },
  { "github/copilot.vim", event = "VeryLazy" },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
      -- print debug --
    end,
  },
  {
    "kylechui/nvim-surround",
    lazy = false,
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  { "marilari88/twoslash-queries.nvim", event = "VeryLazy" },
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
  },
  {
    "kevinhwang91/nvim-bqf",
    event = "VeryLazy",
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "eslint-lsp",
        "prettier",

        "lua-language-server",

        "rust-analyzer",

        "angular-language-server",

        "ansible-language-server",
        "ansible-lint",

        "gopls",

        "nginx-language-server",

        "mypy",
        "ruff",
        "black",
        "pyright",
      },
    },
  },
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
    end,
  },
  {
    "saecki/crates.nvim",
    depedencies = "hrsh7th/nvim-cmp",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require "crates"
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      -- Possible configurable fields can be found on:
      -- https://github.com/zbirenbaum/copilot.lua#setup-and-configuration
      suggestion = {
        enable = true,
      },
      panel = {
        enable = false,
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    opts = function()
      local M = require "plugins.configs.cmp"
      table.insert(M.sources, {
        { name = "copilot", group_index = 1 },
        { name = "nvim_lsp", group_index = 2 },
        { name = "luasnip", group_index = 2 },
        { name = "buffer", group_index = 2 },
        { name = "nvim_lua", group_index = 2 },
        { name = "path", group_index = 2 },
      })
      return M
    end,
  },
  { "folke/neodev.nvim" },

  -- Autocompletion
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "saadparwaiz1/cmp_luasnip" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lua" },
  -- {
  --   "simrat39/rust-tools.nvim",
  -- },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  { "mfussenegger/nvim-ansible", ft = { "yaml.ansible" } },
  { "pearofducks/ansible-vim", ft = { "yaml.ansible" } },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_echo_preview_url = 1
      vim.g.mkdp_browser = "/usr/bin/google-chrome"
    end,
    ft = { "markdown" },
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "johmsalas/text-case.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("textcase").setup {}
      require("telescope").load_extension "textcase"
    end,
    event = "VeryLazy",
    keys = {
      { "ga.", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "v" }, desc = "Telescope" },
    },
  },
  { "xiyaowong/nvim-transparent", event = "VeryLazy" },
  {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    init = function()
      local wk = require "which-key"
      wk.register({
        ["<leader>cs"] = { ":Silicon<CR>", "Silicon" },
      }, { mode = "v" })
    end,
    config = function()
      require("silicon").setup {
        font = "0xProto Nerd Font Mono=34;Noto Color Emoji",
        theme = "Nord",
        background = "#616e88",
        shadow_color = "#1e1e2e",
        shadow_offset_y = 3,
        shadow_offset_x = 1,
        pad_horiz = 50,
        pad_vert = 30,
        tab_width = 2,
        num_separator = "\u{258f} ",
        no_round_corner = true,
        to_clipboard = true,
        window_title = function()
          return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
        end,
        -- output = "test_code.png",
      }
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
}

return plugins
