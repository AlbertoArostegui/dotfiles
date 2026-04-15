vim.g.mapleader = ' '
vim.opt.exrc = true
vim.opt.secure = true
require("config.lazy")
require("vim-config")
vim.opt.termguicolors = true
--vim.cmd("colorscheme GruberDarker")
-- Autocargar plantilla del diario si el archivo es nuevo
vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = "*/diario/*/*.md",
    callback = function()
        -- Cambia la ruta absoluta según dónde esté tu cerebro
        local template_path = vim.fn.expand("~/Documents/notas/plantillas/plantilla_diario_v1.md")
        if vim.fn.filereadable(template_path) == 1 then
            vim.cmd("0r " .. template_path)
            -- Mueve el cursor a la línea del título y al final para empezar a escribir
            vim.cmd("normal! G")
            vim.cmd("normal! gg$")
        else
            print("No se encuentra la puta plantilla en: " .. template_path)
        end
    end,
})
