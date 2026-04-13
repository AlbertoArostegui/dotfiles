return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set('n', '<leader>e', builtin.find_files, { desc = "Find files" })
            vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = "Live Grep" })
            vim.keymap.set('n', '<leader>?', builtin.keymaps, { desc = 'List keymaps' })
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require('telescope').setup({
                defaults = {
                    preview = {
                        treesitter = false,
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    }
}
