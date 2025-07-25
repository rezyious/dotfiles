vim.keymap.set("n", "<leader>e", ":Ex<CR>", { silent = true })
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { silent = true })
vim.keymap.set("n", "<leader>q", ":q<CR>", { silent = true })
vim.keymap.set("n", "<leader>s", ":w<CR>", { silent = true })
-- vim.keymap.set("n", "<leader>t", ":tabnew<CR>", { silent = true })

-- Zenmode
vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", { silent = true })

-- Telescope
local builtin_telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin_telescope.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin_telescope.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin_telescope.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin_telescope.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fz", builtin_telescope.current_buffer_fuzzy_find, { desc = "Telescope fuzzyfinder" })
vim.keymap.set("n", "<leader>fk", builtin_telescope.keymaps, { desc = "Telescope show keymaps" })

-- LSP
-- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", {})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

-- Enable/disable cmp
vim.api.nvim_set_keymap(
  "n",
  "<leader>cd",
  ":lua require('cmp').setup.buffer({ enabled = false })<CR>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>ce",
  ":lua require('cmp').setup.buffer({ enabled = true })<CR>",
  { noremap = true, silent = true }
)

-- Start and Stop LSP server
vim.keymap.set("n", "<leader>ld", function()
  for _, client in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
    client.stop()
  end
end, { desc = "Stop LSP" })

vim.keymap.set("n", "<leader>le", function()
  vim.cmd("edit") -- Reload current buffer to trigger LSP attach
end, { desc = "Restart LSP by reloading buffer" })

-- Terminal
vim.keymap.set("n", "<Leader>t", ":vsplit | terminal<CR>i", { noremap = true })

-- harpoon
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
