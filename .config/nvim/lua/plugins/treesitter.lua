return {

    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter")
        local languages = { "lua", "c", "cpp", "python" }

        ts.setup({
            install_dir = vim.fn.stdpath("data") .. "/site",
        })

        -- Install missing parsers only in interactive sessions.
        if #vim.api.nvim_list_uis() > 0 then
            ts.install(languages)
        end

        local group = vim.api.nvim_create_augroup("nvim_treesitter_setup", { clear = true })
        vim.api.nvim_create_autocmd("FileType", {
            group = group,
            pattern = languages,
            callback = function(args)
                pcall(vim.treesitter.start, args.buf)
                vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
