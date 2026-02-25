return {
    "williamboman/mason-lspconfig.nvim",
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "emmet_ls",
                "ts_ls",
                "rust_analyzer",
                "bashls",
                "clangd",
                "pylsp",
                "gopls",
                "cssls",
                "html",
            },
            auto_install = false,
            automatic_enable = false,
        })
    end,
}
