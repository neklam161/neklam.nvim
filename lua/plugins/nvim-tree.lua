return
	{
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup({
                view = {
                    width = 30,

                },
            })
	vim.keymap.set('n','<Tab>', ':NvimTreeToggle<CR>', { noremap = true, silent = true})
	vim.keymap.set('n', '<leader>n', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
        end,
}

