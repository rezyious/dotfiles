return {
  "navarasu/onedark.nvim",
  priority = 1000,
  config = function()
    require("onedark").setup({
      style = "darker",
      transparent = true,
      code_style = {
        comments = "none",
        keywords = "bold",
        functions = "none",
        strings = "none",
        variables = "none",
      },
      diagnostics = {
        darker = true,
        undercurl = false,
        background = true,
      },
    })
  end,
}
