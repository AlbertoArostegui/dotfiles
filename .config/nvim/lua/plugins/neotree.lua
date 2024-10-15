return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim",
    },
    config = function()
        require('neo-tree').setup({
            close_if_last_window = true, -- close neo-tree if it is the last window
            event_handlers = {
                {
                    event = "file_open_requested",
                    handler = function()
                        require("neo-tree.command").execute({ action = "close" })
                    end
                }
            }
        })
        vim.keymap.set('n', '<C-n>', ':Neotree filesystem toggle left<CR>', {})
    end
}
