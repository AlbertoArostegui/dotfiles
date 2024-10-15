return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({
            options = {
                theme = require('lualine-config').theme(),
                section_separators = '',
                component_separators = '',
                globalstatus = true,
            }
        })
    end
}
