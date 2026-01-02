return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            log_level = 3,
            notify_no_formatters = true,
            formatters_by_ft = {
                lua = { "stylua" },
                go = { "gofmt" },
                python = { "autopep8" },
                javascript = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                rust = { "rustfmt" },
                c = { "clang-format" },
                bash = { "shfmt" },
                sh = { "shfmt" },
                zsh = { "shfmt" },
            },
        })
    end,
}
