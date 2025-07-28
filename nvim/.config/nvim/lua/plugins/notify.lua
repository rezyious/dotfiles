return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      background_color = "#000000",
      notify_render = "minimal",
    })
  end,
}
