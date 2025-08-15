return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- typescript
    lspconfig.ts_ls.setup({
      autostart = false,
      capabilities = capabilities,
    })

    -- css
    lspconfig.cssls.setup({
      autostart = false,
      capabilities = capabilities,
    })

    -- emmet
    lspconfig.emmet_ls.setup({
      autostart = false,
      capabilities = capabilities,
    })

    -- {{{ Rust
    lspconfig.rust_analyzer.setup({
      capabilities = capabilities,
      autostart = false,
      settings = {
        ["rust-analyzer"] = {
          standalone = true,
          imports = {
            granularity = {
              group = "module",
            },
            prefix = "self",
          },
          cargo = {
            autoload = true,
            buildScripts = {
              enable = true,
            },
          },
          procMacro = {
            enable = true,
          },
        },
      },
    })
    -- }}}
  end,
}
