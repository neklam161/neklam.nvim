return
{ 	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			dark_variant = "main",
			styles = {
				bold = true,
				italic = true,
			},
			 palette = {
        main = {
            gold = "#a789fa", -- Set your custom "gold" color here
        },
    },
		})
	vim.cmd("colorscheme rose-pine")
	end,
}

