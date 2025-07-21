return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      direction = "float", --"float" or "horizontal", "vertical", "tab"
      open_mapping = [[<c-\>]],
    })
  end,
}
