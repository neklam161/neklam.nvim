return
     {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- Set header
        dashboard.section.header.val = {
[[⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠶⠶⠶⠦⣄⠀⠀⠀⠀⠀]],
[[⠀⠀⠀⠀⢠⠞⠉⠉⢀⡜⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠳⡄⠀⠀⠉⢣⡀⠀⠀⠀]],
[[⠀⠀⠀⣰⠏⠀⠀⢠⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡄⠀⠀⠀⢳⠀⠀⠀]],
[[⠀⠀⢠⡏⠀⠀⠀⡸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢳⠀⠀⠀⢸⠀⠀⠀]],
[[⠀⠀⢸⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⢀⣀⡤⠤⠤⠴⠶⠶⠶⠶⠤⠤⣄⣀⠀⠀⠀⠀⠀⣸⠀⠀⠀⢸⠀⠀⠀]],
[[⠀⠀⠘⡆⠀⠀⠀⢹⣄⠀⣠⠔⠚⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠒⢤⣀⣰⠃⠀⠀⠀⡞⠀⠀⠀]],
[[⠀⠀⠀⢷⠀⠀⠀⠀⠙⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠇⠀⠀⠀⡼⠁⠀⠀⠀]],
[[⠀⠀⠀⠈⢳⡀⠀⠀⠀⠀⠀⠀⢀⣤⣤⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣤⣤⣄⠀⠀⠀⠀⢀⡞⠁⠀⠀⠀⠀]],
[[⠀⠀⠀⠀⠀⠙⠲⣄⡀⠀⠀⣰⣿⣿⣿⣿⣿⣧⡀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣷⠀⢸⡶⠋⠀⠀⠀⠀⠀⠀]],
[[⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⡇⢸⡇⠀⠀⠀⠀⠀⠀⠀]],
[[⠀⠀⠀⠀⠀⠀⠀⠈⡇⠀⠀⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⡇⢸⠁⠀⠀⠀⠀⠀⠀⠀]],
[[⠀⠀⠀⠀⠀⠀⠀⠀⢇⠀⠀⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⠃⡼⠀⠀⠀⠀⠀⠀⠀⠀]],
[[⠀⠀⠀⠀⠀⠀⠀⠀⠸⡄⠀⠻⣿⣿⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⡟⢠⠇⠀⠀⠀⠀⠀⠀⠀⠀]],
[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠱⡄⠀⠈⠛⠛⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠛⠋⢀⡜⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡜⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠴⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠓⠶⠦⠤⠤⠤⠤⠴⠒⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],  }

	dashboard.section.header.opts.hl = "AlphaHeader"

        -- Set menu
        dashboard.section.buttons.val = {
            dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
            dashboard.button("p", "  Open project", ":Telescope project <CR>"),
            dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
            dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
            dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
            dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
        }

        -- Set footer
        local function getSessionList()
            local session_dir = vim.fn.stdpath("data") .. "/sessions/"
            local sessions = vim.fn.glob(session_dir .. "*.vim")
            local session_list = {}

            if sessions ~= "" then
                for _, session in ipairs(vim.split(sessions, "\n")) do
                    local session_name = vim.fn.fnamemodify(session, ":t:r")
                    table.insert(session_list, "Session: " .. session_name)
                end
            end

            return session_list
        end

        -- Get working directory name
        local function getCwd()
            local cwd = vim.fn.getcwd()
            return "Working Directory: " .. vim.fn.fnamemodify(cwd, ":~")
        end

        -- Combine directory and session info
        local function getFooter()
            local lines = {getCwd()}
            local sessions = getSessionList()
            if #sessions > 0 then
                table.insert(lines, "\nAvailable Sessions:")
                for _, session in ipairs(sessions) do
                    table.insert(lines, session)
                end
            end

            return lines
        end

        dashboard.section.footer.val = getFooter()

        -- Set header color
        dashboard.section.header.opts.hl = "Function"

        -- Set layout
        dashboard.config.layout = {
            { type = "padding", val = 2 },
            dashboard.section.header,
            { type = "padding", val = 2 },
            {
                type = "group",
                val = {
                    { type = "text", val = "neklam's neovim", opts = { hl = "SpecialComment", position = "center" } },
                    { type = "padding", val = 1 },
                    dashboard.section.buttons,
                },
            },
            { type = "padding", val = 2 },
            dashboard.section.footer,
        }

        -- Send config to alpha
        alpha.setup(dashboard.opts)

        -- Add autocommand to open alpha when no more buffers
        vim.api.nvim_create_autocmd("User", {
            pattern = "BDeletePost*",
            callback = function(event)
                local fallback_name = vim.api.nvim_buf_get_name(event.buf)
                local fallback_ft = vim.api.nvim_buf_get_option(event.buf, "filetype")
                local fallback_on_empty = fallback_name == "" and fallback_ft == ""

                if fallback_on_empty then
                    vim.cmd("Alpha")
                end
            end,
        })
    end
}

