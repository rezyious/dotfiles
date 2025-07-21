return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        transparent = true,
        terminal_colors = true,
        comments = { italic = true },
        keywords = { italic = true },
      })
    end,
  },
}
