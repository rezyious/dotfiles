return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = { "stylua", "prettier" },
      run_on_start = false,
    })
  end,
}
