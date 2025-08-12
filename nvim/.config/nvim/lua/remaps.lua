-- {{{ Telescope
local builtin_telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin_telescope.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin_telescope.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin_telescope.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin_telescope.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fz", builtin_telescope.current_buffer_fuzzy_find, { desc = "Telescope fuzzyfinder" })
vim.keymap.set("n", "<leader>fk", builtin_telescope.keymaps, { desc = "Telescope show keymaps" })
-- }}}

-- {{{ LSP
-- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
-- vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "LSP: hover doc" })
vim.keymap.set("n", "<leader>gr", "<cmd>Lspsaga finder<CR>", { desc = "LSP: refrences" })
vim.keymap.set("n", "<leader>gp", "<cmd>Lspsaga peek_definition<CR>", { desc = "LSP: peek definition" })
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "LSP: go to definition" })
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "LSP: code action" })
vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { desc = "LSP: all symbols" })
-- }}}

-- {{{ Enable/disable cmp
vim.api.nvim_set_keymap(
  "n",
  "<leader>cd",
  ":lua require('cmp').setup.buffer({ enabled = false })<CR>",
  { noremap = true, silent = true, desc = "disable cmp" }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>ce",
  ":lua require('cmp').setup.buffer({ enabled = true })<CR>",
  { noremap = true, silent = true, desc = "enable cmp" }
)
-- }}}

-- {{{ Start and Stop LSP server
vim.keymap.set("n", "<leader>ld", function()
  for _, client in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
    client.stop()
  end
end, { desc = "Stop LSP" })

vim.keymap.set("n", "<leader>le", function()
  vim.cmd("edit")
end, { desc = "Restart LSP by reloading buffer" })
-- }}}

-- {{{ harpoon
vim.keymap.set("n", "<leader>hm", function()
  require("harpoon.ui").toggle_quick_menu()
end, { desc = "Toggle Harpoon quick menu" })

vim.keymap.set("n", "<leader>ha", function()
  require("harpoon.mark").add_file()
end, { desc = "Mark a file in harpoon" })

vim.keymap.set("n", "<leader>hn", function()
  require("harpoon.ui").nav_next()
end, { desc = "Next file in harpoon" })

vim.keymap.set("n", "<leader>hp", function()
  require("harpoon.ui").nav_prev()
end, { desc = "Previous file in harpoon" })
-- }}}

-- {{{ rust
vim.keymap.set(
  "n",
  "<leader>pp",
  'oprintln!("{}");<ESC>F{a',
  { noremap = true, silent = true, desc = "rust - println! macro" }
)

vim.keymap.set(
  "n",
  "<leader>pd",
  'oprintln!("{:?}");<ESC>F{a',
  { noremap = true, silent = true, desc = "rust - println! debug macro" }
)

vim.keymap.set(
  "n",
  "<leader>all",
  "ggO#![allow(dead_code)]<ESC>o#![allow(unused_variables)]<ESC>o<ESC>",
  { noremap = true, silent = true, desc = "rust - allow unused and dead_code" }
)

vim.keymap.set(
  "n",
  "<leader>rf",
  "O#[rustfmt::skip]<ESC>",
  { noremap = true, silent = true, desc = "rust -  #[rustfmt::skip]" }
)

vim.keymap.set(
  "n",
  "<leader>rs",
  "<cmd>LspStart rust_analyzer<CR>",
  { noremap = true, silent = true, desc = "rust -  start rust analyzer" }
)
-- }}}

vim.keymap.set("i", "<C-c>", "<Esc>", { noremap = true }) -- rempa Esc to Ctrl+c :)
vim.keymap.set("n", "<leader>e", ":Ex<CR>", { silent = true, desc = "open netrw" })
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { silent = true })
vim.keymap.set("n", "<leader>q", ":q<CR>", { silent = true })
vim.keymap.set("n", "<leader>s", ":w<CR>", { silent = true })

-- Zenmode
vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", { silent = true })

-- Terminal
vim.keymap.set("n", "<Leader>t", ":vsplit | terminal<CR>i", { noremap = true })

-- format current buffer with conform
vim.keymap.set("n", "<leader>ft", function()
  require("conform").format()
end, { noremap = true, silent = true, desc = "Format current buffer with conform" })

-- Better window navigation
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<m-h>", "<C-w>h", opts)
keymap("n", "<m-j>", "<C-w>j", opts)
keymap("n", "<m-k>", "<C-w>k", opts)
keymap("n", "<m-l>", "<C-w>l", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- windows
vim.keymap.set("n", "<C-w>z", "<cmd>WindowsMaximize<CR>")
vim.keymap.set("n", "<C-w>_", "<cmd>WindowsMaximizeVertically<CR>")
vim.keymap.set("n", "<C-w>|", "<cmd>WindowsMaximizeHorizontally<CR>")
vim.keymap.set("n", "<C-w>=", "<cmd>WindowsEqualize<CR>")

-- tab
vim.keymap.set("n", "<C-t>", "<cmd>tabnew<CR>", { desc = "mine - new tab", noremap = false })
