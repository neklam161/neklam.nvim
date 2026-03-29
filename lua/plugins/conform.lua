-- lua/plugins/conform.lua
-- <leader>cf  → format current file / selection
return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd   = { "ConformInfo" },
    keys  = {
        {
            "<leader>cf",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = { "n", "v" },
            desc = "Format file / range",
        },
    },
    opts = {
        formatters_by_ft = {
            python     = { "ruff_fix", "ruff_format" },
            lua        = { "stylua" },
            yaml       = { "prettier" },
            json       = { "prettier" },
            toml       = { "taplo" },
            markdown   = { "prettier" },
            sh         = { "shfmt" },
            dockerfile = {},
        },
        format_on_save = {
            timeout_ms   = 2000,
            lsp_fallback = true,
        },
        format_after_save = function(buf)
            if vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf)) > 1024 * 1024 then
                return
            end
            return { lsp_fallback = true }
        end,
    },
}
