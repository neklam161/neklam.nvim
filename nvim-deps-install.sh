#!/usr/bin/env bash
# nvim-deps-install.sh — External dependency installer for neklam.nvim

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

ok()   { echo -e "${GREEN}[✓]${NC} $1"; }
warn() { echo -e "${YELLOW}[!]${NC} $1"; }
fail() { echo -e "${RED}[✗]${NC} $1"; }

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "   neklam.nvim — dependency installer"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# ── Required checks ──────────────────────────────────────────────────────────

echo "Checking required dependencies..."

if command -v git &>/dev/null; then
  ok "git $(git --version | awk '{print $3}')"
else
  fail "git not found — install it first"
  exit 1
fi

if command -v python3 &>/dev/null; then
  ok "python3 $(python3 --version | awk '{print $2}')"
else
  fail "Python 3 not found — install Python 3.10+"
  exit 1
fi

if command -v node &>/dev/null; then
  ok "node $(node --version)"
else
  fail "Node.js not found — install Node.js 18+ (required by Mason for yamlls, jsonls, dockerls)"
  exit 1
fi

echo ""

# ── ruff ─────────────────────────────────────────────────────────────────────

echo "Installing ruff (Python linter + formatter)..."
if pip3 install --user --upgrade ruff &>/dev/null; then
  ok "ruff installed → $(ruff --version 2>/dev/null || echo 'ok')"
else
  fail "ruff installation failed"
fi

# ── prettier ─────────────────────────────────────────────────────────────────

echo "Installing prettier (YAML / JSON / Markdown formatter)..."
if npm install -g prettier &>/dev/null; then
  ok "prettier installed → $(prettier --version 2>/dev/null || echo 'ok')"
else
  fail "prettier installation failed"
fi

# ── debugpy ──────────────────────────────────────────────────────────────────

DEBUGPY_VENV="$HOME/.virtualenvs/debugpy"

echo "Setting up debugpy in $DEBUGPY_VENV..."
if [ ! -d "$DEBUGPY_VENV" ]; then
  python3 -m venv "$DEBUGPY_VENV"
fi

if "$DEBUGPY_VENV/bin/pip" install --upgrade debugpy &>/dev/null; then
  ok "debugpy installed → $("$DEBUGPY_VENV/bin/python" -m debugpy --version 2>/dev/null || echo 'ok')"
else
  fail "debugpy installation failed"
fi

echo ""

# ── Optional tools ────────────────────────────────────────────────────────────

echo "Checking optional tools..."

if command -v taplo &>/dev/null; then
  ok "taplo found (TOML formatter)"
else
  warn "taplo not found — install via: cargo install taplo-cli"
fi

if command -v shfmt &>/dev/null; then
  ok "shfmt found (shell formatter)"
else
  warn "shfmt not found — install via your package manager (e.g. brew install shfmt)"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Done! Open Neovim and run :checkhealth"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
