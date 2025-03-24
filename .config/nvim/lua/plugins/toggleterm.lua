return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local toggleterm = require("toggleterm")

    toggleterm.setup({
      size = 10, -- Default size, can be overridden per terminal
      open_mapping = "<c-t>", -- Default open mapping, can be overridden per terminal
      hide_numbers = true, -- Hide line numbers in toggleterm buffers
      shade_filetypes = {}, -- Filetypes to shade in toggleterm buffers
      shade_terminals = true, -- Shade terminals in toggleterm buffers
      shading_factor = 2, -- Shade factor in toggleterm buffers
      start_in_insert = true, -- Start in insert mode
      insert_mappings = true, -- Enable insert mode mappings
      terminal_mappings = true, -- Enable terminal mode mappings
      persist_size = true,
      direction = "float", -- Default direction
      close_on_exit = false, -- Keep the terminal open after process exit
      shell = vim.o.shell, -- Use Neovim's default shell
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })

    function _G.set_terminal_keymaps()
      local opts = { noremap = true }
      vim.api.nvim_buf_set_keymap(0, "t", "<esc><esc>", [[<C-\><C-n>]], opts)
      vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
    end

    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

    local Terminal = require("toggleterm.terminal").Terminal

    local floating_term = Terminal:new({
        cmd = vim.o.shell,
        direction = "float",
        size = 15,
        close_on_exit = false
    })

    function _G.toggle_floating_term()
        floating_term:toggle()
    end
        vim.keymap.set('n', "<leader>v", "<cmd>lua _G.toggle_floating_term()<CR>", { desc = "Toggle floating terminal" })

  end,
}
