return {
  "nvimdev/lspsaga.nvim",
  config = function()
    require("lspsaga").setup({
      hover = {
        max_width = 1.0,
        max_height = 0.5,
      },
      symbol_in_winbar = {
        enable = false,
      },
      lightbulb = {
        enable = false,
      },
    })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
}
