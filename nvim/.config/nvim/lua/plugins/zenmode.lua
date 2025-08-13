return {
  "folke/zen-mode.nvim",
  config = function()
    require("zen-mode").setup({
      window = {
        width = 110,
        -- backdrop = 0.95,
      },
      plugins = {
        tmux = { enabled = false },
      },
      on_open = function()
        -- Hide tmux status bar
        vim.fn.system("tmux set status off")
      end,
      on_close = function()
        -- Show tmux status bar again
        vim.fn.system("tmux set status on")
      end,
    })
  end,
}
