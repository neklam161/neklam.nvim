-- ============================================================
-- init.lua — neklam's neovim
-- ============================================================

-- Leader keys (must be set before lazy)
vim.g.mapleader      = " "
vim.g.maplocalleader = " "

-- ── Editor options ──────────────────────────────────────────
vim.g.have_nerd_font     = true
vim.opt.number           = true
vim.opt.relativenumber   = true
vim.opt.mouse            = "a"
vim.opt.showmode         = false
vim.opt.clipboard        = "unnamedplus"
vim.opt.breakindent      = true
vim.opt.undofile         = true
vim.opt.ignorecase       = true
vim.opt.smartcase        = true
vim.opt.signcolumn       = "yes"
vim.opt.updatetime       = 250
vim.opt.timeoutlen       = 300
vim.opt.splitright       = true
vim.opt.splitbelow       = true
vim.opt.list             = true
vim.opt.listchars        = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand       = "split"
vim.opt.cursorline       = true
vim.opt.scrolloff        = 10
vim.opt.swapfile         = false
vim.opt.hlsearch         = true

-- ── Keep markdown-preview from auto-closing ─────────────────
vim.g.mkdp_auto_close = 0

-- ── Basic keymaps ───────────────────────────────────────────
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("i", "jj",    "<Esc>")
vim.keymap.set("i", "kk",    "<Esc>$", { noremap = true, silent = true })

-- Remap visual-mode 'a' → 'i' (inner text-objects with 'a')
vim.keymap.set("x", "a", "i", { noremap = true, silent = true })

-- Terminal escape
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus left" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus right" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus down" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus up" })

-- Telescope
vim.keymap.set("n", "<leader>p", "<cmd>Telescope project<CR>",   { noremap = true, silent = true, desc = "Open project" })
vim.keymap.set("n", "<leader>w", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true, desc = "Live grep" })

-- Markdown preview
vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreview<CR>", { noremap = true, silent = true, desc = "Markdown preview" })

-- Trouble toggle 
vim.keymap.set("n", "<leader>td", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Toggle Trouble" })

-- ── Bootstrap lazy.nvim ─────────────────────────────────────
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
