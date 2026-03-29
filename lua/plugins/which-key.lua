-- lua/plugins/which-key.lua
return {
    "folke/which-key.nvim",
    event = "VimEnter",
    opts = {
        delay = 400,
        icons = {
            mappings = vim.g.have_nerd_font,
        },
        spec = {
            { "<leader>g",  group = "Git" },
            { "<leader>gh", group = "Git hunks" },
            { "<leader>d",  group = "Debug (DAP)" },
            { "<leader>dP", group = "DAP Python" },
            { "<leader>t",  group = "Trouble / diagnostics" },
            { "<leader>c",  group = "Code" },
            { "<leader>r",  group = "Refactor / rename" },
        },
    },
}
