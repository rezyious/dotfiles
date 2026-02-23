-- Disable colors, syntax, and Tree-sitter highlighting
vim.api.nvim_create_user_command("BWOn", function()
  vim.cmd("syntax off")
  vim.cmd("TSDisable highlight")
  vim.cmd("colorscheme default")
  vim.cmd([[
    hi clear
    set background=dark
  ]])
end, {})

-- Re-enable colors, syntax, and Tree-sitter highlighting
vim.api.nvim_create_user_command("BWOff", function()
  vim.cmd("syntax on")
  vim.cmd("TSEnable highlight")
  vim.cmd("colorscheme monochrome")
end, {})

-- functions
function SetColorColumnWhite()
  vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#ffffff" })
  vim.cmd("set colorcolumn=120")
end

function DisableColorColumn()
  vim.cmd("set colorcolumn=0")
end

-- transparent background function
function Nobg()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- black background
function Blackbg()
  vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000" })
end

function SetBg(color)
  vim.api.nvim_set_hl(0, "Normal", { bg = color })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = color })
end

function WhiteComments()
  vim.api.nvim_set_hl(0, "Comment", { fg = "#fffff8", italic = true })
end
