return {
  {
    "aliqyan-21/darkvoid.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("darkvoid").setup({
        transparent = true,
        colors = {
          fg = "#c0c0c0",
          bg = "#1c1c1c",
          cursor = "#bdfe58",
          line_nr = "#404040",
          visual = "#303030",
          comment = "#585858",
          string = "#d1d1d1",
          func = "#e1e1e1",
          kw = "#f1f1f1",
          identifier = "#b1b1b1",
          type = "#a1a1a1",
          type_builtin = "#c5c5c5", -- current
          search_highlight = "#1bfd9c",
          operator = "#1bfd9c",
          bracket = "#e6e6e6",
          preprocessor = "#4b8902",
          bool = "#66b2b2",
          constant = "#b2d8d8",
          plugins = {
            lualine = false,
          },
        },
      })

      vim.api.nvim_set_hl(0, "StatusLine", { fg = "#c6c6c6", bg = "#2b2b2b" })
      vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#c6c6c6", bg = "#080808" })
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        compile = false,
        undercurl = false,
        commentStyle = { italic = false },
        keywordStyle = { italic = false },
        statementStyle = { bold = true },
        transparent = true,
        terminalColors = true,
        theme = "dragon",
        background = {
          dark = "dragon",
          light = "lotus",
        },
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
          functions = {},
          variables = {},
        },
        transparent = true,

        -- "hint" color to the "orange" color, the "error" color bright red
        on_colors = function(colors)
          colors.hint = colors.yellow
          colors.error = "#ff0000"
        end,

        on_highlights = function(hl, c)
          -- change color for comments
          hl.Comment = {
            fg = "#c2c7cf",
          }
          -- borderless telescope
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
        end,
      })
    end,
  },
}
