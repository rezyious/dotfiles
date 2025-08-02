return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      stages = "slide",
      background_color = "#000000",
      render = "minimal",
      timeout = 1500,
    })
  end,
}
