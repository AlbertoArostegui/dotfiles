return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    config = function()
        vim.fn["mkdp#util#install"]()
        vim.api.nvim_set_keymap('n', '<leader>p', '<Plug>MarkdownPreviewToggle', { noremap = true, silent = true })
    end,
}
