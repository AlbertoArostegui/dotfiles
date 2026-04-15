return {
    {
        "lervag/vimtex",
        lazy = false,
        init = function()
            -- Dile a VimTeX que use Skim como visor por defecto
            vim.g.vimtex_view_method = 'skim'
            
            -- Opcional pero recomendado: que no te abra la ventana de quickfix con cada puto warning
            vim.g.vimtex_quickfix_mode = 0
        end,
    }
}
