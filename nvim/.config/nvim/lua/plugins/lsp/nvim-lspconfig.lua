return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- C
    lspconfig.clangd.setup({
      capabilities = capabilities,
    })

    -- python
    lspconfig.pylsp.setup({
      capabilities = capabilities,
    })

    -- go
    lspconfig.gopls.setup({
      capabilities = capabilities,
    })

    -- lua
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
    })

    -- typescript
    lspconfig.ts_ls.setup({
      capabilities = capabilities,
    })

    -- css
    lspconfig.cssls.setup({
      capabilities = capabilities,
    })

    -- emmet
    lspconfig.emmet_ls.setup({
      capabilities = capabilities,
    })

    -- bash
    lspconfig.bashls.setup({
      capabilities = capabilities,
    })

    -- Rust
    lspconfig.rust_analyzer.setup({
      capabilities = capabilities,
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
  end,
}
