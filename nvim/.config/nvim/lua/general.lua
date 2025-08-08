vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.swapfile = false
vim.opt.cursorline = true
vim.opt.scrolloff = 5
vim.o.textwidth = 120
vim.o.wrap = true
vim.o.linebreak = true
vim.o.colorcolumn = "120"
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#555005" })
vim.opt.clipboard = "unnamedplus"
vim.opt.shortmess:append("I")
vim.opt.signcolumn = "yes"
vim.o.foldmethod = "marker"
vim.o.foldmarker = "{{{,}}}"
vim.g.netrw_banner = 0
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.fillchars:append({ eob = " " })
vim.opt.termguicolors = true
vim.o.mousemoveevent = true

-- show diagnostics instead of just hinting
vim.diagnostic.config({
  virtual_text = {
    prefix = ">>", -- or '>>', '■', '', etc.
    spacing = 4,
    format = function(diagnostic)
      return diagnostic.message:gsub("\n.*", "") -- show only first line
    end,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

-- transparent background function
function Nobg()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- opposite of above
function Solidbg()
  vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
end

-- reset status line colors
function Reset_colors_override()
  vim.api.nvim_set_hl(0, "StatusLine", { fg = "#c6c6c6", bg = "#2b2b2b" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#c6c6c6", bg = "#080808" })
  vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "#000000" })
end

-- Comments continuation
-- Enable 'r' (continue comments on Enter) only in insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:append("r")
  end,
})

-- Disable 'r' when leaving insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove("r")
  end,
})

-- Always remove 'o' (never continue comment on 'o' key)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove("o")
  end,
})
