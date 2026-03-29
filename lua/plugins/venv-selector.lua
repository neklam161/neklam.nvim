-- lua/plugins/venv-selector.lua
-- <leader>cv → open venv picker
return {
    "linux-cultist/venv-selector.nvim",
    branch       = "regexp",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "neovim/nvim-lspconfig",
        "mfussenegger/nvim-dap-python",
    },
    ft   = "python",
    cmd  = "VenvSelect",
    keys = {
        { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select Python venv", ft = "python" },
    },
    opts = {
        settings = {
            options = {
                notify_user_on_venv_activation = true,
            },
        },
    },
}
