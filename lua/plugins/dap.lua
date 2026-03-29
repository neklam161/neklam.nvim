-- lua/plugins/dap.lua
-- Keymaps (leader d prefix):
--   <leader>dc  → Continue / start
--   <leader>db  → Toggle breakpoint
--   <leader>dB  → Conditional breakpoint
--   <leader>di  → Step into
--   <leader>do  → Step over
--   <leader>dO  → Step out
--   <leader>du  → Toggle DAP UI
--   <leader>dPt → Debug Python test method
--   <leader>dPc → Debug Python test class
return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            -- UI
            {
                "rcarriga/nvim-dap-ui",
                dependencies = { "nvim-neotest/nvim-nio" },
                -- Auto-open/close UI when session starts/ends
                config = function()
                    local dap, dapui = require("dap"), require("dapui")
                    dapui.setup()
                    dap.listeners.after.event_initialized["dapui_config"]  = function() dapui.open() end
                    dap.listeners.before.event_terminated["dapui_config"]  = function() dapui.close() end
                    dap.listeners.before.event_exited["dapui_config"]      = function() dapui.close() end
                end,
            },
            -- Python adapter
            {
                "mfussenegger/nvim-dap-python",
                ft = "python",
                config = function()
                    -- Uses the active venv python, falls back to system python
                    local python = vim.env.VIRTUAL_ENV
                        and (vim.env.VIRTUAL_ENV .. "/bin/python")
                        or vim.fn.exepath("python3")
                    require("dap-python").setup(python)
                end,
            },
        },
        keys = {
            -- Core DAP
            { "<leader>dc",  function() require("dap").continue() end,          desc = "DAP: Continue" },
            { "<leader>db",  function() require("dap").toggle_breakpoint() end, desc = "DAP: Toggle breakpoint" },
            { "<leader>dB",  function()
                require("dap").set_breakpoint(vim.fn.input("Condition: "))
            end, desc = "DAP: Conditional breakpoint" },
            { "<leader>di",  function() require("dap").step_into() end,         desc = "DAP: Step into" },
            { "<leader>do",  function() require("dap").step_over() end,         desc = "DAP: Step over" },
            { "<leader>dO",  function() require("dap").step_out() end,          desc = "DAP: Step out" },
            { "<leader>dr",  function() require("dap").repl.open() end,         desc = "DAP: Open REPL" },
            { "<leader>du",  function() require("dapui").toggle() end,          desc = "DAP: Toggle UI" },
            -- Python-specific
            { "<leader>dPt", function() require("dap-python").test_method() end, ft = "python", desc = "DAP: Debug test method" },
            { "<leader>dPc", function() require("dap-python").test_class() end,  ft = "python", desc = "DAP: Debug test class" },
        },
    },
}
