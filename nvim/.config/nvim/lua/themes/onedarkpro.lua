return {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    config = function()
        require("onedarkpro").setup({
            styles = {
                types = "bold",
                methods = "bold",
                keywords = "bold,italic",
                operators = "bold",
                variables = "bold,italic",
            },
            highlights = {
                Comment = { fg = "#ffffff" },
                String = { fg = "#ffffff" },
                Variable = { fg = "#ffffff", italic = true },
                Function = { fg = "#61afef", bold = true },

                -- Treesitter
                ["@string"] = { fg = "#ffffff" },
                ["@variable"] = { fg = "#ffffff" },
                ["@property"] = { fg = "#ffffff" },
                ["@punctuation.delimiter"] = { fg = "#ffffff" },
                ["@punctuation.bracket"] = { fg = "#ffffff" },
                ["@punctuation.special"] = { fg = "#ffffff" },
                ["@function"] = { fg = "#61afef" },
                ["@keyword"] = { fg = "#c3e88d" },
            },
            options = {
                transparency = false,
            },
        })
    end,
}
