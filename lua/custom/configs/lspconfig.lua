local config = require "plugins.configs.lspconfig"
local util = require "lspconfig/util"
local on_attach = config.on_attach
local capabilities = config.capabilities

-- local util = require "lspconfig/util"
local lspconfig = require "lspconfig"

lspconfig.tsserver.setup {
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    require("twoslash-queries").attach(client, bufnr)
  end,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestion = true,
    },
  },
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
  on_new_config = function(new_config, root_dir)
    local pipfile_exists = util.search_ancestors(root_dir, function(path)
      local pipfile = util.path.join(path, "Pipfile")
      if util.path.is_file(pipfile) then
        return true
      else
        return false
      end
    end)
    if pipfile_exists then
      new_config.cmd = { "pipenv", "run", "pyright-langserver", "--stdio" }
    end
  end,
}

lspconfig.angularls.setup {
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    client.server_capabilities.renameProvider = false
  end,
  capabilities = capabilities,
  root_dir = util.root_pattern("angular.json", ".angular"),
}

lspconfig.ansiblels.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = util.root_pattern("ansible.cfg", ".ansible-lint"),
  filetypes = { "yaml.ansible" },
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "rust", "rs" },
  root_dir = util.root_pattern "Cargo.toml",
  settings = {
    ["rust-analyer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
}
