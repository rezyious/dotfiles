return {
  "aliqyan-21/darkvoid.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("darkvoid").setup({
      transparent = false,
      colors = {
        fg = "#c0c0c0",
        bg = "#1c1c1c",
        cursor = "#bdfe58",
        line_nr = "#404040",
        visual = "#303030",
        comment = "#585858",
        string = "#d1d1d1",
        func = "#e1e1e1",
        kw = "#f1f1f1",
        identifier = "#b1b1b1",
        type = "#a1a1a1",
        type_builtin = "#c5c5c5", -- current
        search_highlight = "#1bfd9c",
        operator = "#1bfd9c",
        bracket = "#e6e6e6",
        preprocessor = "#4b8902",
        bool = "#66b2b2",
        constant = "#b2d8d8",
        plugins = {
          lualine = false,
        },
      },
    })

    vim.api.nvim_set_hl(0, "StatusLine", { fg = "#c6c6c6", bg = "#2b2b2b" })
    vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#c6c6c6", bg = "#080808" })
  end,
}
