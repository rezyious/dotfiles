return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "tabs",
        always_show_bufferline = false,
        show_close_icon = false,
        separator_style = "thin",

        diagnostics = "nvim_lsp",
        ---@diagnostic disable-next-line: unused-local
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match("error") and " " or level:match("warning") and " " or " "
          return " " .. icon .. count
        end,
      },

      highlights = {
        background = { fg = "#c0caf5", bg = "#1a1b26" },
        buffer_selected = { fg = "#7aa2f7", bg = "#3b4261", bold = true },
        buffer_visible = { fg = "#565f89", bg = "#1a1b26" },
        modified = { fg = "#9d7cd8", bg = "#1a1b26" },
        modified_selected = { fg = "#9d7cd8", bg = "#3b4261", bold = true },
        modified_visible = { fg = "#9d7cd8", bg = "#1a1b26" },
        indicator_selected = { fg = "#7dcfff", bg = "#3b4261" },
        separator = { fg = "#565f89", bg = "#1a1b26" },
        separator_selected = { fg = "#565f89", bg = "#3b4261" },
        separator_visible = { fg = "#565f89", bg = "#1a1b26" },
        close_button = { fg = "#f7768e", bg = "#1a1b26" },
        close_button_selected = { fg = "#f7768e", bg = "#3b4261" },
        tab = { fg = "#c0caf5", bg = "#1a1b26" },
        tab_selected = { fg = "#7aa2f7", bg = "#3b4261", bold = true },
        tab_close = { fg = "#f7768e", bg = "#1a1b26" },
        error = { fg = "#f7768e", bg = "#1a1b26" },
        error_selected = { fg = "#f7768e", bg = "#3b4261", bold = true },
        warning = { fg = "#e0af68", bg = "#1a1b26" },
        warning_selected = { fg = "#e0af68", bg = "#3b4261", bold = true },
        info = { fg = "#73daca", bg = "#1a1b26" },
        info_selected = { fg = "#73daca", bg = "#3b4261", bold = true },
      },
    })
  end,
}
