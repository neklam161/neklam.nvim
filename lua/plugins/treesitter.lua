return
{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = { "python", "html", "javascript", "css", "json" , "yaml","dockerfile","toml","bash","lua","markdown","markdown_inline",},
      highlight = { enable = true },
    }
  end,
}

