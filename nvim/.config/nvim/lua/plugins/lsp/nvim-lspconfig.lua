return {
  "neovim/nvim-lspconfig",
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- defaults for all servers
    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    -- enable all servers
    -- vim.lsp.enable({
    --   "emmet_ls",
    --   "ts_ls",
    -- })
  end,
}
