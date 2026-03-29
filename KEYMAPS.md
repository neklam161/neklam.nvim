# Keymaps Reference

**Leader:** `Space`

> Tip: press `<Space>` and pause — [which-key.nvim](https://github.com/folke/which-key.nvim)
> will show a popup of all available bindings for that prefix.

---

## General

| Mode | Key | Action |
|---|---|---|
| Normal | `<Esc>` | Clear search highlight |
| Insert | `jj` | Exit to Normal mode |
| Insert | `kk` | Exit to Normal mode + jump to end of line |
| Visual | `a` | Alias for `i` (use `a` as inner text-object prefix) |
| Terminal | `<Esc><Esc>` | Exit terminal mode |

---

## Window Navigation

> ⚠️ `<C-h/j/k/l>` are **overridden by Harpoon** for buffer selection.
> To restore window navigation, remove the four `harpoon:list():select()` lines in `harpoon.lua`.

| Mode | Key | Action |
|---|---|---|
| Normal | `<C-h>` | Focus left window _(overridden by Harpoon → buffer 1)_ |
| Normal | `<C-j>` | Focus lower window _(overridden by Harpoon → buffer 2)_ |
| Normal | `<C-k>` | Focus upper window _(overridden by Harpoon → buffer 3)_ |
| Normal | `<C-l>` | Focus right window _(overridden by Harpoon → buffer 4)_ |

---

## File Tree — nvim-tree

| Mode | Key | Action |
|---|---|---|
| Normal | `<Tab>` | Toggle file tree open / close |
| Normal | `<leader>n` | Focus file tree |

---

## Telescope — Fuzzy Finder

| Mode | Key | Action |
|---|---|---|
| Normal | `<leader>f` | Find files (includes hidden) |
| Normal | `<leader>w` | Live grep (search text in project) |
| Normal | `<leader>p` | Open project switcher |

---

## Harpoon — Buffer Bookmarks

| Mode | Key | Action |
|---|---|---|
| Normal | `<leader>a` | Add current file to Harpoon list |
| Normal | `<C-e>` | Open Harpoon quick menu |
| Normal | `<C-h>` | Jump to Harpoon buffer 1 |
| Normal | `<C-j>` | Jump to Harpoon buffer 2 |
| Normal | `<C-k>` | Jump to Harpoon buffer 3 |
| Normal | `<C-l>` | Jump to Harpoon buffer 4 |
| Normal | `<C-S-P>` | Previous Harpoon buffer |
| Normal | `<C-S-N>` | Next Harpoon buffer |

---

## LSP — Language Server Protocol

_These keymaps are buffer-local and only active when an LSP server is attached._

| Mode | Key | Action |
|---|---|---|
| Normal | `gd` | Go to definition |
| Normal | `gr` | Go to references |
| Normal | `K` | Hover documentation |
| Normal | `<leader>rn` | Rename symbol |
| Normal | `<leader>ca` | Code action |

---

## Completion — nvim-cmp

_Active in Insert and Select mode inside completion popup._

| Mode | Key | Action |
|---|---|---|
| Insert | `<C-n>` | Next completion item |
| Insert | `<C-p>` | Previous completion item |
| Insert | `<C-y>` | Confirm selection |
| Insert | `<CR>` | Confirm selection |
| Insert | `<C-Space>` | Trigger completion manually |
| Insert | `<C-b>` | Scroll docs up |
| Insert | `<C-f>` | Scroll docs down |
| Insert/Select | `<Tab>` | Next item · confirm · or expand snippet |
| Insert/Select | `<S-Tab>` | Previous item or jump back in snippet |
| Insert/Select | `<C-l>` | Jump forward in snippet |
| Insert/Select | `<C-h>` | Jump backward in snippet |

---

## Formatting — conform.nvim

| Mode | Key | Action |
|---|---|---|
| Normal | `<leader>cf` | Format current file |
| Visual | `<leader>cf` | Format selected range |

Format also runs automatically **on save** for all supported filetypes.

**Formatters per filetype:**

| Filetype | Formatter |
|---|---|
| Python | `ruff_fix` → `ruff_format` |
| Lua | `stylua` |
| YAML | `prettier` |
| JSON | `prettier` |
| Markdown | `prettier` |
| TOML | `taplo` |
| Shell | `shfmt` |

---

## Git — gitsigns.nvim

_Buffer-local. Active when file is inside a git repo._

| Mode | Key | Action |
|---|---|---|
| Normal | `]h` | Jump to next hunk |
| Normal | `[h` | Jump to previous hunk |
| Normal/Visual | `<leader>ghs` | Stage hunk |
| Normal/Visual | `<leader>ghr` | Reset hunk |
| Normal | `<leader>ghS` | Stage entire buffer |
| Normal | `<leader>ghR` | Reset entire buffer |
| Normal | `<leader>ghu` | Undo last stage |
| Normal | `<leader>ghp` | Preview hunk inline |
| Normal | `<leader>gb` | Toggle current line blame |
| Normal | `<leader>ghd` | Diff this file against index |

---

## Git — diffview.nvim

| Mode | Key | Action |
|---|---|---|
| Normal | `<leader>gd` | Open diff (all uncommitted changes) |
| Normal | `<leader>gh` | File history for current file |
| Normal | `<leader>gD` | Close diffview |

---

## Trouble — Diagnostics Panel

| Mode | Key | Action |
|---|---|---|
| Normal | `<leader>td` | Toggle workspace diagnostics |
| Normal | `<leader>tw` | Toggle document diagnostics |
| Normal | `<leader>tD` | Toggle workspace diagnostics (alias) |
| Normal | `<leader>tr` | Toggle LSP references |
| Normal | `<leader>ts` | Toggle LSP definitions |
| Normal | `<leader>tq` | Toggle quickfix list |

---

## Debugger — nvim-dap (Python)

| Mode | Key | Action |
|---|---|---|
| Normal | `<leader>dc` | Continue / start debug session |
| Normal | `<leader>db` | Toggle breakpoint |
| Normal | `<leader>dB` | Set conditional breakpoint (prompts for condition) |
| Normal | `<leader>di` | Step into |
| Normal | `<leader>do` | Step over |
| Normal | `<leader>dO` | Step out |
| Normal | `<leader>dr` | Open DAP REPL |
| Normal | `<leader>du` | Toggle DAP UI panels |
| Normal | `<leader>dPt` | Debug current test **method** _(Python only)_ |
| Normal | `<leader>dPc` | Debug current test **class** _(Python only)_ |

> The DAP UI opens and closes automatically when a session starts and ends.

---

## Python — venv-selector.nvim

| Mode | Key | Action |
|---|---|---|
| Normal | `<leader>cv` | Open venv picker (searches venv, .venv, pyenv, conda) |

---

## Markdown

| Mode | Key | Action |
|---|---|---|
| Normal | `<leader>mp` | Open Markdown Preview in browser |

---

## Leader group summary (which-key popup labels)

| Prefix | Group |
|---|---|
| `<leader>g` | Git |
| `<leader>gh` | Git hunks |
| `<leader>d` | Debug (DAP) |
| `<leader>dP` | DAP Python |
| `<leader>t` | Trouble / diagnostics |
| `<leader>c` | Code (format, venv) |
| `<leader>r` | Refactor / rename |
