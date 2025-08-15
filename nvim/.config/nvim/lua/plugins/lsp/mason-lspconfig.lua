return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "cssls",
        "emmet_ls",
        "ts_ls",
        "rust_analyzer",
      },
      auto_install = false,
      automatic_enable = false,
    })
  end,
}
