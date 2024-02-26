---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",
  statusline = {
    theme = "minimal",
  },
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
