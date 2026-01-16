return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            log_level = 3,
            notify_no_formatters = true,
            formatters_by_ft = {
                lua = { "stylua" },
                javascript = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                c = { "clang-format" },
                rust = { "rustfmt" },
                go = { "gofmt" }
            },
        })
    end,
}
