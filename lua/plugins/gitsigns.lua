-- lua/plugins/gitsigns.lua
return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        signs = {
            add          = { text = "▎" },
            change       = { text = "▎" },
            delete       = { text = "" },
            topdelete    = { text = "" },
            changedelete = { text = "▎" },
            untracked    = { text = "┆" },
        },
        current_line_blame      = false, -- toggle with <leader>gb
        current_line_blame_opts = {
            virt_text          = true,
            virt_text_pos      = "eol",
            delay              = 800,
            ignore_whitespace  = false,
        },
        on_attach = function(buf)
            local gs = package.loaded.gitsigns
            local map = function(mode, l, r, desc)
                vim.keymap.set(mode, l, r, { buffer = buf, desc = desc, silent = true })
            end

            -- Navigation
            map("n", "]h", function()
                if vim.wo.diff then vim.cmd.normal({ "]c", bang = true })
                else gs.nav_hunk("next") end
            end, "Next hunk")
            map("n", "[h", function()
                if vim.wo.diff then vim.cmd.normal({ "[c", bang = true })
                else gs.nav_hunk("prev") end
            end, "Prev hunk")

            -- Staging / reset
            map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>",  "Stage hunk")
            map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>",  "Reset hunk")
            map("n",          "<leader>ghS", gs.stage_buffer,             "Stage buffer")
            map("n",          "<leader>ghR", gs.reset_buffer,             "Reset buffer")
            map("n",          "<leader>ghu", gs.undo_stage_hunk,          "Undo stage hunk")

            -- Preview / blame
            map("n", "<leader>ghp", gs.preview_hunk,        "Preview hunk")
            map("n", "<leader>gb",  gs.toggle_current_line_blame, "Toggle line blame")

            -- Diff
            map("n", "<leader>ghd", gs.diffthis,            "Diff this")
        end,
    },
}
