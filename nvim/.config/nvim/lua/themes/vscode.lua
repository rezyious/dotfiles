return {
  "Mofiqul/vscode.nvim",
  config = function()
    require("vscode").setup({
      transparent = false,
      italic_comments = false,
    })
  end,
}
