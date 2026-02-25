-- remaps 

-- #- telescope
local builtin_telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin_telescope.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin_telescope.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin_telescope.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin_telescope.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fz", builtin_telescope.current_buffer_fuzzy_find, { desc = "Telescope fuzzyfinder" })
vim.keymap.set("n", "<leader>fk", builtin_telescope.keymaps, { desc = "Telescope show keymaps" })
vim.keymap.set("n", "<leader>fm", builtin_telescope.man_pages, { desc = "Telescope man pages" })
-- -#

-- #- lsp
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP hover" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP code action" })
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "LSP: go to definition" })
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "LSP refrences" })
-- -#

-- #- cmp
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
-- -#

-- #- harpoon
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
-- -#

-- #- Better window navigation
vim.keymap.set("n", "<m-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<m-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<m-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<m-l>", "<C-w>l", { noremap = true, silent = true })
-- -#

-- #- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
-- -#

-- #- debugger
vim.keymap.set("n", "<F5>", require("dap").continue, { noremap = true, silent = true, desc = "dap continue" })
vim.keymap.set("n", "<F10>", require("dap").step_over, { noremap = true, silent = true, desc = "dap step over" })
vim.keymap.set("n", "<F11>", require("dap").step_into, { noremap = true, silent = true, desc = "dap step into" })
vim.keymap.set("n", "<F12>", require("dap").step_out, { noremap = true, silent = true, desc = "dap step out" })
vim.keymap.set(
    "n",
    "<leader>b",
    require("dap").toggle_breakpoint,
    { noremap = true, silent = true, desc = "dap toggle break point" }
)
vim.keymap.set("n", "<leader>dg", require("dap").terminate, { noremap = true, silent = true, desc = "dap terminate" })
-- -#

-- personal
vim.keymap.set("i", "<C-c>", "<Esc>", { noremap = true }) -- remap Esc to Ctrl+c :)
vim.keymap.set("n", "<leader>e", ":Ex<CR>", { silent = true, desc = "open netrw" })
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { silent = true })
vim.keymap.set("n", "<leader>q", ":q<CR>", { silent = true })
vim.keymap.set("n", "<leader>s", ":w<CR>", { silent = true })
vim.keymap.set("n", "<C-t>", "<cmd>tabnew<CR>", { desc = "mine - new tab", noremap = true })
vim.keymap.set("n", "<leader>t", function()
    vim.cmd("terminal")
    vim.cmd("startinsert")
end, { desc = "open terminal", noremap = true })

-- zen mode
vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", { silent = true, noremap = true, desc = "zenmode" })

-- format current buffer with conform
vim.keymap.set("n", "<leader>ft", function()
    require("conform").format()
end, { noremap = true, silent = true, desc = "Format current buffer with conform" })
