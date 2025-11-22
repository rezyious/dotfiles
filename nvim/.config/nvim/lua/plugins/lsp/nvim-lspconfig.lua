return {
  "neovim/nvim-lspconfig",
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- defaults for all servers
    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    vim.lsp.config("rust_analyzer", {
      settings = {
        ["rust-analyzer"] = {
          standalone = true,
          imports = {
            granularity = { group = "module" },
            prefix = "self",
          },
          cargo = {
            autoload = true,
            buildScripts = { enable = true },
          },
          procMacro = { enable = true },
        },
      },
    })

    -- enable all servers
    -- vim.lsp.enable({
    --   "lua_ls",
    --   "pylsp",
    --   "cssls",
    --   "emmet_ls",
    --   "clangd",
    --   "tsserver",
    --   "rust_analyzer",
    --   "bashls",
    --   "gopls",
    -- })
  end,
}
