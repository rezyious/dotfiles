return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "pylsp",
        "emmet_ls",
        "cssls",
        "ts_ls",
        "rust_analyzer",
        "clangd",
        "bashls",
      },
      auto_install = true,
      automatic_enable = false,
    })
  end,
}
