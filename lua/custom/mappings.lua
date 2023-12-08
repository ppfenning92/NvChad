local utils = require "custom.utils"

local M = {}
M.general = {
  i = {
    ["<C-s>"] = { "<cmd> w <CR>", "Save file" },
  },

  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
    ["<leader>rs"] = {
      function()
        local pos = vim.api.nvim_win_get_cursor(0)[2]
        local line = vim.api.nvim_get_current_line()
        local nline = line:sub(0, pos) .. utils.randomString(8) .. line:sub(pos + 1)
        vim.api.nvim_set_current_line(nline)
      end,
      "Generate random string of lenth 8",
    },
    ["<leader>rc"] = {
      function()
        local pos = vim.api.nvim_win_get_cursor(0)[2]
        local line = vim.api.nvim_get_current_line()
        local nline = line:sub(0, pos) .. utils.randomString(8, "0123456789") .. line:sub(pos + 1)
        vim.api.nvim_set_current_line(nline)
      end,
      "Generate random numeric code of length 8",
    },
  },
}

M.comment = {

  i = {
    ["<C-#>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  --   ["<C-#>"] = {
  --     "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  --     "Toggle comment",
  --   },
  -- },
}
return M
