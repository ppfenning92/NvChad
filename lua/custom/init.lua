vim.wo.relativenumber = true
vim.api.nvim_set_option_value("colorcolumn", "80", {})
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  update_in_insert = true,
})
-- vim.diagnostic.config {
--   update_in_insert = true
-- }

vim.o.modeline = true
vim.o.modelines = 5

_G.OS = os.execute "uname -a" or "Windows"
_G.IS_LINUX = OS == "Linux"
_G.IS_WSL = IS_LINUX and OS:lower():find "microsoft" and true or false

if IS_WSL then
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 1,
  }
end
vim.keymap.set("i", "<F13>", 'copilot#Accept("<CR>")', {
  expr = true,
  replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
