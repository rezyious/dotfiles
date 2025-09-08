return {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("cyberdream").setup({
      variant = "default", -- use "light" for the light variant.
      transparent = false,
      borderless_pickers = true,
      overrides = function(colors)
        return {
          Comment = { fg = "#ffffff", bg = "NONE", italic = true },
        }
      end,
    })
  end,
}

-- hello
