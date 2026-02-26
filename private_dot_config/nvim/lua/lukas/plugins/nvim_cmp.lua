return {
  "hrsh7th/nvim-cmp",
  version = false,
  event = "InsertEnter",
  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lua",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "onsails/lspkind.nvim"
  },
  opts = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    return {
      mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        -- ["<C-e>"] = cmp.mapping.close(),
        ["<C-y>"] = cmp.mapping.confirm( { select = true }),
        ["<C-Space>"] = cmp.mapping.complete()
      }),
      sources = cmp.config.sources({
        -- Order is the ranking of the completion priority.
        -- { name = "gh_issues" },
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "luasnip" },
        -- keyword_length = 5, added within the set, sets the minimum length of the keyword for ocmpletion to occur.
        { name = "buffer" }
      }),
      snippets = cmp.config.sources({
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end
      }),
      formatting = {
        format = lspkind.cmp_format {
          with_text = true,
          menu = {
            buffer = "[buf]",
            nvim_lsp = "[LSP]",
            nvim_lua = "[api]",
            path = "[path]",
            luasnip = "[snip]",
            gh_issues = "[issues]"
          }
        }
      },
      experimental = {
        -- Not sure what this is.
        view_entries = "native",
        ghost_text = false
      }
    }
  end
}
