return {
  "mason-org/mason.nvim",
  lazy = false,
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "neovim/nvim-lspconfig",
    { "folke/neodev.nvim", opts = true },
  },
  opts = function()
    require("neodev").setup()

    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()

    mason.setup({})

    mason_lspconfig.setup({
      ensure_installed = {
        -- c/c++
        "clangd",
        -- lua
        "lua_ls",
        -- markdown
        "marksman",
        -- python
        "pyright",
        -- rust
        "rust_analyzer",
        -- web
        "cssls",
        -- "emmet_ls",
        "emmet_language_server",
      },

      automatic_installation = true
    })

    mason_tool_installer.setup({
      ensure_installed = {
        -- c/c++
        "clangd",
        -- lua
        "stylua",
        -- python
        "black",
        "pylint",
        "isort",
        -- rust
        -- web
        "eslint",
        "prettier",
        "typescript-language-server",
      }
    })

    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals =  { "vim" },
          },
          completion = {
            callSnippet = "Replace",
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            }
          }
        }
      }
    })

    vim.lsp.config("emmet_language_server", {
      capabilities = capabilities,
      filetypes = {
        "css",
        "eruby",
        "html",
        "javascript",
        "javascriptreact",
        "less",
        "sass",
        "scss",
        "pug"
      }
    })

    vim.lsp.enable("lua_ls")
    vim.lsp.enable("emmet_language_server")

  end
}
