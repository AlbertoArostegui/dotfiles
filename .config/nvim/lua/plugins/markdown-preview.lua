return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    config = function()
        vim.fn["mkdp#util#install"]()
        vim.keymap.set('n', '<leader>p', '<Plug>MarkdownPreviewToggle', { noremap = true, silent = true, desc = 'Markdown: Toggle preview' })
    end,
}
