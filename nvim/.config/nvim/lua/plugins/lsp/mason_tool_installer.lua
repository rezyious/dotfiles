return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = { "stylua", "prettier", "autopep8", "clang-format" },
      run_on_start = false,
    })
  end,
}
