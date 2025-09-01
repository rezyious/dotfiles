return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    require("rose-pine").setup({
      styles = {
        bold = true,
        italic = false,
        transparency = false,
      },
      highlight_groups = {
        Comment = { fg = "foam" },
      },
    })
  end,
}
