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


lspconfig.angularls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = util.root_pattern("angular.json", ".angular"),
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      }
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
