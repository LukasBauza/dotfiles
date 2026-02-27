return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function ()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function (ev)
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = "Show LSP references"
        vim.keymap.set("n", "gR", "<cmd>FzfLua lsp_references<CR>", opts)

        opts.desc = "Go to declaration"
        -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gD", "<cmd>FzfLua lsp_declarations<CR>", opts)

        opts.desc = "Show LSP definitions"
        vim.keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", opts)

        opts.desc = "Show LSP implementations"
        vim.keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", opts)

        opts.desc = "Show LSP type definitions"
        vim.keymap.set("n", "gt", "<cmd>FzfLua lsp_type_defs<CR>", opts)

        opts.desc = "Show available code actions"
        vim.keymap.set({ "n", "v" }, "<leader>vca", function() vim.lsp.buf.code_action() end, opts)

        opts.desc = "Smart rename"
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Show buffer diagnostics"
        vim.keymap.set("n", "<leader>D", "<cmd>FzfLua diagnostics_document<CR>", opts)

        opts.desc = "Show line diagnostics"
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

        opts.desc = "Show documentation for what is under cursor"
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "<leader>h", function() vim.lsp.buf.signature_help() end, opts)
      end
    })
  end
}
