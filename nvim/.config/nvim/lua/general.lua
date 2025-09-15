vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.autoindent = false
vim.opt.smartindent = false
vim.opt.cindent = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.swapfile = false
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.textwidth = 120
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.colorcolumn = "120"
vim.opt.clipboard = "unnamedplus"
vim.opt.shortmess:append("I")
vim.opt.signcolumn = "yes"
vim.opt.foldmethod = "marker"
vim.opt.foldmarker = "{{{,}}}"
vim.g.netrw_banner = 0
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.fillchars:append({ eob = " " })
vim.opt.termguicolors = true

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

function SetColorColumn()
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

-- opposite of above
function Solidbg()
  vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
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

-- emmet
vim.api.nvim_create_user_command("LspStartEmmet", function()
  vim.lsp.start({
    name = "emmet_ls",
    cmd = { "emmet-ls", "--stdio" },
    root_dir = vim.fn.getcwd(), -- or use lspconfig.util.root_pattern if you prefer
  })
end, {})
