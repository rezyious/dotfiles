local set_hl = vim.api.nvim_set_hl

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "black-and-white"

set_hl(0, "Normal", { fg = "#ffffff", bg = "#000000" })
set_hl(0, "NormalFloat", { fg = "#ffffff", bg = "#000000" })

set_hl(0, "Comment", { fg = "#888888", italic = true })
set_hl(0, "Constant", { fg = "#ffffff" })
set_hl(0, "Identifier", { fg = "#ffffff" })
set_hl(0, "Statement", { fg = "#ffffff", bold = true })

set_hl(0, "CursorLine", { bg = "#111111" })
set_hl(0, "Visual", { bg = "#333333" })
set_hl(0, "LineNr", { fg = "#777777" })
set_hl(0, "CursorLineNr", { fg = "#ffffff", bold = true })
set_hl(0, "StatusLine", { fg = "#ffffff", bg = "#111111" })
set_hl(0, "Pmenu", { fg = "#ffffff", bg = "#111111" })
set_hl(0, "PmenuSel", { fg = "#000000", bg = "#ffffff" })

set_hl(0, "Error", { fg = "#ffffff", underline = true })
set_hl(0, "Warning", { fg = "#aaaaaa", underline = true })
set_hl(0, "Hint", { fg = "#888888", underline = true })
set_hl(0, "Info", { fg = "#cccccc", underline = true })
