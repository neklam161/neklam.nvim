-- lua/plugins/lsp.lua
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim",            config = true },
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        { "j-hui/fidget.nvim",                  opts  = {} },
        "hrsh7th/cmp-nvim-lsp",
        -- NEW: JSON / YAML schema catalog
        "b0o/schemastore.nvim",
    },
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp-setup", { clear = true }),
            callback = function(event)
                local buf = event.buf
                local map = function(keys, func, desc)
                    vim.keymap.set("n", keys, func, { buffer = buf, desc = desc })
                end
                map("gd",          require("telescope.builtin").lsp_definitions,  "Goto Definition")
                map("gr",          require("telescope.builtin").lsp_references,   "Goto References")
                map("K",           vim.lsp.buf.hover,                             "Hover Documentation")
                map("<leader>rn",  vim.lsp.buf.rename,                            "Rename")
                map("<leader>ca",  vim.lsp.buf.code_action,                       "Code Action")
            end,
        })

        -- ── Capabilities ───────────────────────────────────
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend(
            "force",
            capabilities,
            require("cmp_nvim_lsp").default_capabilities()
        )

        -- ── Mason: install all servers + tools ─────────────
        require("mason").setup()
        require("mason-tool-installer").setup({
            ensure_installed = {
                -- Python
                "pyright", "ruff",
                -- Lua
                "lua_ls", "stylua",
                -- C/C++
                "clangd",
                -- Docker
                "dockerls", "docker_compose_language_service",
                -- Data / config
                "yamlls", "jsonls",
            },
            auto_update = false,
            run_on_start = true,
        })
        require("mason-lspconfig").setup({
            ensure_installed = {
                "pyright", "lua_ls", "clangd",
                "dockerls", "docker_compose_language_service",
                "yamlls", "jsonls",
            },
        })

        -- ── Python venv resolver ───────────────────────────
        local function get_python_path()
            if vim.env.VIRTUAL_ENV then
                return vim.env.VIRTUAL_ENV .. "/bin/python"
            end
            local p = vim.fn.exepath("python")
            return (p ~= "") and p or vim.fn.exepath("python3")
        end

        -- ── Pyright ───────────────────────────────────────
        vim.lsp.config("pyright", {
            capabilities = capabilities,
            settings = {
                python = {
                    analysis = {
                        autoSearchPaths        = true,
                        useLibraryCodeForTypes = true,
                        diagnosticMode         = "workspace",
                        autoImportCompletions  = true,
                        -- Let ruff handle style diagnostics
                        typeCheckingMode       = "standard",
                    },
                },
            },
            on_init = function(client)
                client.config.settings.python.pythonPath = get_python_path()
                client.notify("workspace/didChangeConfiguration",
                    { settings = client.config.settings })
            end,
        })

        -- ── Ruff (Python linter/formatter as LSP) ─────────
        vim.lsp.config("ruff", {
            capabilities = capabilities,
            on_attach = function(client, _)
                client.server_capabilities.hoverProvider = false
            end,
        })

        -- ── Clangd ────────────────────────────────────────
        vim.lsp.config("clangd", { capabilities = capabilities })

        -- ── Lua ───────────────────────────────────────────
        vim.lsp.config("lua_ls", {
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime    = { version = "LuaJIT" },
                    diagnostics = { globals = { "vim", "require" } },
                    hint        = { enable = true, semicolon = "Disable" },
                    codeLens    = { enable = true },
                },
            },
        })

        -- ── Dockerfile LSP ────────────────────────────────
        -- Requires: npm i -g dockerfile-language-server-nodejs  (installed via mason)
        vim.lsp.config("dockerls", { capabilities = capabilities })

        -- ── Docker Compose LSP ────────────────────────────
        -- Requires: npm i -g @microsoft/compose-language-service (installed via mason)
        vim.lsp.config("docker_compose_language_service", { capabilities = capabilities })

        -- ── YAML (with SchemaStore) ───────────────────────
        -- Validates docker-compose, GitHub Actions, AWS CloudFormation, etc.
        -- Requires: npm i -g yaml-language-server  (installed via mason)
        vim.lsp.config("yamlls", {
            capabilities = capabilities,
            settings = {
                yaml = {
                    schemaStore = { enable = false, url = "" },
                    schemas     = require("schemastore").yaml.schemas({
                        select = {
                            "docker-compose.yml",
                            "GitHub Workflow",
                            "GitHub Action",
                            "AWS CloudFormation",
                            "openapi.json",
                        },
                    }),
                    validate    = true,
                    format      = { enable = true },
                },
            },
        })

        -- ── JSON (with SchemaStore) ───────────────────────
        -- Requires: npm i -g vscode-langservers-extracted  (installed via mason)
        vim.lsp.config("jsonls", {
            capabilities = capabilities,
            settings = {
                json = {
                    schemas  = require("schemastore").json.schemas(),
                    validate = { enable = true },
                },
            },
        })

        vim.lsp.enable("pyright")
        vim.lsp.enable("ruff")
        vim.lsp.enable("clangd")
        vim.lsp.enable("lua_ls")
        vim.lsp.enable("dockerls")
        vim.lsp.enable("docker_compose_language_service")
        vim.lsp.enable("yamlls")
        vim.lsp.enable("jsonls")
    end,
}
