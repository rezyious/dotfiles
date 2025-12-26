return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyonight").setup({
            style = "night",
            transparent = false,
            dim_inactive = false,
            on_colors = function(colors)
                colors.hint = colors.orange
                colors.error = "#ff0000"
                colors.warning = colors.yellow
                colors.comment = colors.green
            end,

            on_highlights = function(hl, c)
                hl.String = { fg = "#ffffff" }
                hl.Keyword = { fg = c.blue0 }
                hl.Variable = { fg = "#ffffff" }

                -- #- black background [disabled]
                -- hl.Normal = {
                --     bg = "#000000",
                -- }
                -- hl.NormalFloat = {
                --     bg = "#000000",
                -- }
                -- hl.SignColumn = {
                --     bg = "#000000",
                -- }
                -- hl.ColorColumn = {
                --     bg = "#1c1c1c",
                -- }
                -- -#
                -- #-  Borderless Telescope
                local prompt = "#2d3149"
                hl.TelescopeNormal = {
                    bg = c.bg_dark,
                    fg = c.fg_dark,
                }
                hl.TelescopeBorder = {
                    bg = c.bg_dark,
                    fg = c.bg_dark,
                }
                hl.TelescopePromptNormal = {
                    bg = prompt,
                }
                hl.TelescopePromptBorder = {
                    bg = prompt,
                    fg = prompt,
                }
                hl.TelescopePromptTitle = {
                    bg = prompt,
                    fg = prompt,
                }
                hl.TelescopePreviewTitle = {
                    bg = c.bg_dark,
                    fg = c.bg_dark,
                }
                hl.TelescopeResultsTitle = {
                    bg = c.bg_dark,
                    fg = c.bg_dark,
                }
                -- -#
            end,
        })
    end,
}
