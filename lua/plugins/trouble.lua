-- ~/.config/nvim/lua/plugins/trouble.lua
return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("trouble").setup({
            position = "right",
            auto_open = false,
            auto_close = true,
            use_diagnostic_signs = true,
        })

        -- v3 uses "Trouble <mode>" instead of "TroubleToggle <mode>"
        vim.keymap.set("n", "<leader>td", "<cmd>Trouble diagnostics toggle<cr>",            { desc = "Toggle Trouble" })
        vim.keymap.set("n", "<leader>tw", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",{ desc = "Document Diagnostics" })
        vim.keymap.set("n", "<leader>tD", "<cmd>Trouble diagnostics toggle<cr>",            { desc = "Workspace Diagnostics" })
        vim.keymap.set("n", "<leader>tr", "<cmd>Trouble lsp_references toggle<cr>",         { desc = "LSP References" })
        vim.keymap.set("n", "<leader>tq", "<cmd>Trouble qflist toggle<cr>",                 { desc = "Quickfix List" })
        vim.keymap.set("n", "<leader>ts", "<cmd>Trouble lsp_definitions toggle<cr>",        { desc = "LSP Definitions" })
    end,
}
