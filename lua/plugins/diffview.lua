-- lua/plugins/diffview.lua
-- Keymaps:
--   <leader>gd  → open diff against current index (uncommitted changes)
--   <leader>gh  → open file history for current file
--   <leader>gD  → close diffview
return {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = {
        "DiffviewOpen",
        "DiffviewClose",
        "DiffviewToggleFiles",
        "DiffviewFocusFiles",
        "DiffviewFileHistory",
    },
    keys = {
        { "<leader>gd", "<cmd>DiffviewOpen<cr>",             desc = "Diffview: open" },
        { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>",    desc = "Diffview: file history" },
        { "<leader>gD", "<cmd>DiffviewClose<cr>",            desc = "Diffview: close" },
    },
    opts = {
        use_icons = true,
        view = {
            default = { winbar_info = true },
        },
        file_panel = {
            win_config = { height = 20 },
        },
    },
}
