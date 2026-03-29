return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        vim.keymap.set("n", "<leader>f", function()
            require("telescope.builtin").find_files({ hidden = true })
        end, { desc = "Find Files" })
    end,
}

