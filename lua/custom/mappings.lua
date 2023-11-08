local M = {}
M.general = {
  i = {
    ["<C-s>"] = { "<cmd> w <CR>", "Save file" },
  }    
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
