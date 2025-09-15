return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "pylsp",
        "emmet_ls",
        "cssls",
        "ts_ls",
        "rust_analyzer",
        "clangd",
      },
      auto_install = true,
      automatic_enable = false,
    })
  end,
}
