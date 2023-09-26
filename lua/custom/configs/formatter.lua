local M = {
  filetype = {
    javascript = {
      require("formatter.filetype.javascript").prettier
    },
    typescript = {
      require("formatter.filetype.typescript").prettier
    },
    ["*"] = {
      require("formatter.filetype.any").remove_trailing_whitespace
    }
  }
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  command = "FormatWriteLock"
})

return M
