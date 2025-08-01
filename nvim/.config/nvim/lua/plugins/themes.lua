return {
  {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("lackluster").setup({
        tweak_color = {
          lack = "#f1f1f1",
          luster = "#f1f1f1",
          gray1 = "#f1f1f1",
        },
        tweak_syntax = {
          string = "#ffffff",
          string_escape = "#f1f1f1",
          comment = "#dddddd",
          builtin = "#eeeeee",
          keyword = "#dcdcdc",
        },
        tweak_background = {
          normal = "none",
          telescope = "none",
        },
      })
      vim.cmd.colorscheme("lackluster")
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
            fg = "#f0f2f5",
          }
          -- {{{ borderless telescope
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
          -- }}}
        end,
      })
    end,
  },
}
