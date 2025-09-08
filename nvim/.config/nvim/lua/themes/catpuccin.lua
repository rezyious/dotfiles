return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = false,
      custom_highlights = function(colors)
        return {
          Comment = { fg = "#fffcfc" },
        }
      end,
    })
  end,
}
