return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
    "stevearc/overseer.nvim",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    require("overseer").setup()

    dap.defaults.fallback.exception_breakpoints = {}

    require("mason-nvim-dap").setup({
      ensure_installed = { "cppdbg" },
      automatic_installation = true,
    })

    local cpptools_bin = vim.fn.stdpath("data") .. "/mason/packages/cpptools/extension/debugAdapters/bin"
    local engine_src = cpptools_bin .. "/cppdbg.ad7Engine.json"
    local engine_dst = cpptools_bin .. "/nvim-dap.ad7Engine.json"
    if vim.fn.filereadable(engine_src) == 1 and vim.fn.filereadable(engine_dst) == 0 then
      local ok, lines = pcall(vim.fn.readfile, engine_src)
      if ok then
        pcall(vim.fn.writefile, lines, engine_dst)
      end
    end

    local cppdbg_path = vim.fn.stdpath("data") .. "/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7"
    dap.adapters.cppdbg = {
      type = "executable",
      command = cppdbg_path,
    }

    dap.configurations.cpp = {
      {
        name = "Launch",
        type = "cppdbg",
        request = "launch",
        program = function()
          return vim.fn.input("Ejecutable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopAtEntry = false,
        MIMode = "gdb",
        setupCommands = {
          {
            description = "Enable pretty-printing for gdb",
            text = "-enable-pretty-printing",
            ignoreFailures = false,
          },
        },
      },
    }
    dap.configurations.c = dap.configurations.cpp

    -- UI
    dapui.setup({
      layouts = {
        {
          elements = {
            { id = "breakpoints", size = 0.15 },
            { id = "stacks",      size = 0.15 },
            { id = "watches",     size = 0.10 },
            { id = "scopes",      size = 0.60 },
          },
          size = 40,
          position = "left",
        },
        {
          elements = {
            { id = "repl",    size = 0.5 },
            { id = "console", size = 0.5 },
          },
          size = 15,
          position = "bottom",
        },
      },
    })
    require("nvim-dap-virtual-text").setup()

    dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
    dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
    dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

    vim.keymap.set("n", "<F5>",  dap.continue,  { desc = "DAP: Continue" })
    vim.keymap.set("n", "<F10>", dap.step_over,  { desc = "DAP: Step over" })
    vim.keymap.set("n", "<F11>", dap.step_into,  { desc = "DAP: Step into" })
    vim.keymap.set("n", "<F12>", dap.step_out,   { desc = "DAP: Step out" })
    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "DAP: Toggle breakpoint" })
    vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "DAP: Toggle UI" })
    vim.keymap.set("n", "<leader>B", function()
      dap.set_breakpoint(vim.fn.input("Condición: "))
    end, { desc = "DAP: Conditional breakpoint" })
    vim.keymap.set("n", "<leader>lp", function()
      dap.set_breakpoint(nil, nil, vim.fn.input("Log: "))
    end, { desc = "DAP: Logpoint" })
    vim.keymap.set("n", "<leader>dr", dap.repl.open,  { desc = "DAP: REPL" })
    vim.keymap.set("n", "<leader>dl", dap.run_last,   { desc = "DAP: Relaunch last" })
    vim.keymap.set("n", "<leader>dx", dap.terminate,  { desc = "DAP: Kill session" })

    vim.keymap.set("n", "<leader>dh", require("dap.ui.widgets").hover, { desc = "DAP: Hover variable" })

    local widgets = require("dap.ui.widgets")
    vim.keymap.set("n", "<leader>ds", function()
      widgets.centered_float(widgets.scopes)
    end, { desc = "DAP: Floating scopes" })
    vim.keymap.set("n", "<leader>df", function()
      widgets.centered_float(widgets.frames)
    end, { desc = "DAP: Floating frames" })
  end,
}
