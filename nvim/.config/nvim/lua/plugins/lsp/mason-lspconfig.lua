return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "cssls",
        "emmet_ls",
        "ts_ls",
        "bashls",
        "pylsp",
        "rust_analyzer",
        "gopls",
        "clangd",
      },
      auto_install = false,
      automatic_enable = false,
    })
  end,
}
