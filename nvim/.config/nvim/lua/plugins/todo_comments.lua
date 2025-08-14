return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("todo-comments").setup({
      keywords = {
        NOTE = { icon = "⁕ ", color = "info" },
        WARN = { icon = " ", color = "error" },
        TODO = { icon = "‣ ", color = "default" },
        PERF = { icon = "P ", color = "info" },
        HACK = { icon = "H ", color = "warning" },
        TEST = { icon = "T ", color = "test" },
        _ = { icon = " ", color = "error" },
      },
    })
  end,
}
-- keywords :
-- NOTE:
-- WARN:
-- TODO:
-- PERF:
-- HACK:
-- TEST:
-- _:
