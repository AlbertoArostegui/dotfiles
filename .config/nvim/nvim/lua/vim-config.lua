--Tabwidth to 4 and convert tabs to spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=2")

--Relative line numbers
vim.wo.number = true
vim.wo.relativenumber = true

--Remap to <leader>pf to the explorer
vim.api.nvim_set_keymap('n', "<leader>pf", ":Ex<CR>", { noremap = true,  silent = true })

--Gui for neovide
vim.o.guifont = "Iosevka Nerd Font Mono:h14"

-- NEOVIDE
--Neovide window
local alpha = function()
  return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
end
vim.g.neovide_opacity = 0.0
vim.g.transparency = 0.8
vim.g.neovide_background_color = "#0f1197" .. alpha()
vim.g.neovide_hide_mouse_when_typing = true

if vim.g.neovide then
  vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
  vim.keymap.set('v', '<D-c>', '"+y') -- Copy
  vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
  vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
end

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})

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

