return {
  "rebelot/kanagawa.nvim",
  config = function()
    require("kanagawa").setup({
      compile = false,
      undercurl = false,
      commentStyle = { italic = false },
      keywordStyle = { italic = false },
      statementStyle = { bold = true },
      transparent = false,
      terminalColors = true,
      theme = "dragon",
      background = {
        dark = "dragon",
        light = "lotus",
      },
    })
  end,
}
