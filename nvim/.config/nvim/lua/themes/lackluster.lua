return {
  "slugbyte/lackluster.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("lackluster").setup({
      tweak_color = {
        lack = "#f1f1f1",
        luster = "#f1f1f1",
        gray1 = "#f1f1f1",
      },
      tweak_syntax = {
        string = "#ffffff",
        string_escape = "#f1f1f1",
        comment = "#dddddd",
        builtin = "#eeeeee",
        keyword = "#dcdcdc",
      },
      tweak_background = {
        normal = "none",
        telescope = "none",
      },
    })
  end,
}
