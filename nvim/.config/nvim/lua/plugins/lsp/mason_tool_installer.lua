return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
        require("mason-tool-installer").setup({
            ensure_installed = { "stylua", "prettier", "clang-format", "shfmt", "codelldb", "black" },
            run_on_start = false,
        })
    end,
}
