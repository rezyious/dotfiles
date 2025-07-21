return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("todo-comments").setup({
      keywords = {
        NOTICE = { icon = " ", color = "info" },
        IMPORTANT = { icon = " ", color = "error" },
      },
    })
  end,
}

-- Defaults :
-- TODO
-- HACK
-- WARN
-- PERF
-- NOTE
-- TEST
