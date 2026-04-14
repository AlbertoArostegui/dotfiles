--Tabwidth to 4 and convert tabs to spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

--Relative line numbers
vim.wo.number = true
vim.wo.relativenumber = true

--Remap to <leader>pf to the explorer
vim.api.nvim_set_keymap('n', "<leader>pf", ":Ex<CR>", { noremap = true,  silent = true, desc = "NetRW Explorer" })

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true })

-- Tabbing
local map = vim.keymap.set

local opts = {
  noremap = true,
  silent = true,
}

map('n', "<C-Tab>", ":tabnext<CR>", { desc = "Go to next tab" })
map('n', "<C-S-Tab>", ":tabprevious<CR>", { desc = "Go to previous tab" })
for i = 1, 9 do
  map('n', "<C-" .. i .. '>', i .. "gt", { desc = "Go to tab " .. i })
end
map('n', "<C-0>", ":tablast<CR>", { desc = "Go to last tab" })

