--Tabwidth to 4 and convert tabs to spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

--Relative line numbers
vim.g.number = true
vim.g.relativenumber = true

--Remap to <leader>pf to the explorer
vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', "<leader>pf", ":Ex<CR>", { noremap = true,  silent = true })

--Gui for neovide
vim.o.guifont = "Iosevka Nerd Font Mono:h14"
