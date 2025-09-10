require("general")
require("config.lazy")
require("remaps")

vim.cmd("colorscheme monochrome")
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#ffffff" })
