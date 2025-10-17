vim.g.mapleader = ' '
require("config.lazy")
require("vim-config")
vim.opt.termguicolors = true
vim.cmd("colorscheme GruberDarker")

-- === Neovim + Tmux + GDB integration ===
local gdb_pane = "right"

local function tmux_send(cmd)
  vim.fn.system("tmux send-keys -t " .. gdb_pane .. " '" .. cmd .. "' C-m")
end

-- Keymaps
vim.keymap.set("n", "<F5>",     function() tmux_send("run") end, { desc = "GDB run/continue" })
vim.keymap.set("n", "<leader>gb",     function() tmux_send("break " .. vim.fn.expand("%:p") .. ":" .. vim.fn.line(".")) end, { desc = "GDB breakpoint" })
vim.keymap.set("n", "<F10>",    function() tmux_send("next") end, { desc = "GDB step over" })
vim.keymap.set("n", "<F11>",    function() tmux_send("step") end, { desc = "GDB step into" })
vim.keymap.set("n", "<S-F11>",  function() tmux_send("finish") end, { desc = "GDB step out" })
vim.keymap.set("n", "<F12>",    function() tmux_send("print " .. vim.fn.expand("<cword>")) end, { desc = "GDB print variable" })
vim.keymap.set("n", "<leader>d",function() tmux_send("display " .. vim.fn.expand("<cword>")) end, { desc = "GDB auto-display variable" })

-- Extra: remove all breakpoints
vim.keymap.set("n", "<leader>db", function() tmux_send("delete") end, { desc = "GDB delete all breakpoints" })

-- Extra: show backtrace (call stack)
vim.keymap.set("n", "<leader>bt", function() tmux_send("backtrace") end, { desc = "GDB backtrace" })

