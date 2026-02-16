return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local colors = {
            cyan = "#79dac8",
            black = "#080808",
            white = "#ffffff",
            red = "#ff5189",
            grey_1 = "#303030",
            grey_2 = "#5f5f5f",
        }
        local my_theme = {
            normal = {
                a = { fg = colors.white, bg = colors.grey_2 },
                b = { fg = colors.white, bg = colors.grey_1 },
                c = { fg = colors.white, bg = colors.black },
            },

            insert = { a = { fg = colors.black, bg = colors.white } },
            visual = { a = { fg = colors.black, bg = colors.cyan } },
            replace = { a = { fg = colors.black, bg = colors.red } },

            inactive = {
                a = { fg = colors.white, bg = colors.black },
                b = { fg = colors.white, bg = colors.black },
                c = { fg = colors.white },
            },
        }
        require("lualine").setup({
            options = {
                theme = my_theme,
                component_separators = "",
                section_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
                lualine_b = { "filename", "branch" },
                lualine_c = { "lsp_status", "diagnostics" },
                lualine_x = {},
                lualine_y = { "filetype", "progress" },
                lualine_z = {
                    { "location", separator = { right = "" }, left_padding = 2 },
                },
            },
            inactive_sections = {
                lualine_a = { "filename" },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { "location" },
            },
            tabline = {},
            extensions = {},
        })
    end,
}
