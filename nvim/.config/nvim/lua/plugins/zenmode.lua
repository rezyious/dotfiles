return {
  "folke/zen-mode.nvim",
  config = function()
    require("zen-mode").toggle({
      width = 120,
      backdrop = 0.9,
    })
  end,
}
