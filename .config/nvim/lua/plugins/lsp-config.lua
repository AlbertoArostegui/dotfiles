return {
    -- mason.nvim and mason-lspconfig.nvim parts remain the same...
    {
        "williamboman/mason.nvim",
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls", "clangd" },
            automatic_installation = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            -- Add cmp-nvim-lsp as a dependency here too, or ensure it loads first
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function ()
            local mason_lspconfig = require("mason-lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp") -- <--- Get cmp's LSP capabilities

            local on_attach = function(client, bufnr)
                -- Your existing on_attach keymaps (K, gd, gD, etc.) go here...
                local opts = { noremap=true, silent=true, buffer=bufnr }
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, vim.tbl_extend('force', opts, { desc = 'LSP: Hover documentation' }))
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend('force', opts, { desc = 'LSP: Go to definition' }))
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, vim.tbl_extend('force', opts, { desc = 'LSP: Go to declaration' }))
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, vim.tbl_extend('force', opts, { desc = 'LSP: Go to implementation' }))
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, vim.tbl_extend('force', opts, { desc = 'LSP: List references' }))
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, vim.tbl_extend('force', opts, { desc = 'LSP: Rename symbol' }))
                vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, vim.tbl_extend('force', opts, { desc = 'LSP: Code actions' }))
                vim.keymap.set('n', '<leader>v', vim.diagnostic.open_float, vim.tbl_extend('force', opts, { desc = 'LSP: Line diagnostics' }))
                vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, vim.tbl_extend('force', opts, { desc = 'LSP: Previous diagnostic' }))
                vim.keymap.set('n', ']d', vim.diagnostic.goto_next, vim.tbl_extend('force', opts, { desc = 'LSP: Next diagnostic' }))

                -- Add other on_attach logic if needed
            end

            -- *** IMPORTANT: Get capabilities from nvim-cmp ***
            local capabilities = cmp_nvim_lsp.default_capabilities()
            -- You might need to merge capabilities if you have other sources modifying them
            -- local capabilities = vim.tbl_deep_extend('force', vim.lsp.protocol.make_client_capabilities(), cmp_nvim_lsp.default_capabilities())


            local servers = mason_lspconfig.get_installed_servers()

            for _, server_name in ipairs(servers) do
                vim.lsp.config(server_name, {
                    on_attach = on_attach,
                    -- *** Pass the capabilities to the server setup ***
                    capabilities = capabilities,
                    -- settings = { ... } -- Server specific settings if needed
                })
                vim.lsp.enable(server_name)
            end
        end
    }
}
