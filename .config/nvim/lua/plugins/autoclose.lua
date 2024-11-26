return {
	"m4xshen/autoclose.nvim",
	lazy = false,
	priority = 1000,
	config = function()
        require('autoclose').setup({
            keys = {
                ["`"] = { escape = false, close = false}
            },
            options = {
                disabled_filetypes = {"text"},
                disable_when_touch = "[%w(%[{]"
            }
        })
	end,
}
