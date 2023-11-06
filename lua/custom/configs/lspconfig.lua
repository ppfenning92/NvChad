local config = require("plugins.configs.lspconfig")
local util = require "lspconfig/util"
local on_attach = config.on_attach
local capabilities = config.capabilities

-- local util = require "lspconfig/util"
local lspconfig = require("lspconfig")

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestion = true,
    }
  }
}

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"rust", "rs"},
  root_dir = util.root_pattern("Cargo.toml"),
  settings = {
    ['rust-analyer'] = {
      cargo = {
        allFeatures = true,
      }
    }
  }
})
