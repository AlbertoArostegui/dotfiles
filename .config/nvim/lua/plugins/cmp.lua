return {
  -- Autocompletion Engine
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter", -- Load cmp when entering insert mode
    dependencies = {
      -- Sources for completion
      "hrsh7th/cmp-nvim-lsp", -- Source for LSP suggestions
      "hrsh7th/cmp-buffer",   -- Source for words in current buffer
      "hrsh7th/cmp-path",     -- Source for file system paths
      --"hrsh7th/cmp-cmdline", -- Source for vim command line

      -- Snippet Engine (Optional but Recommended)
      "L3MON4D3/LuaSnip",
      -- Optional dependency for snippet expansion
      dependencies = { "rafamadriz/friendly-snippets" }, -- Optional collection of snippets

      -- Snippet Source for nvim-cmp
      "saadparwaiz1/cmp_luasnip",

      -- Adds nice icons to completion items (Optional)
      "onsails/lspkind.nvim",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind") -- For icons

      -- Load snippets (Optional)
      require("luasnip/loaders/from_vscode").lazy_load()
      luasnip.config.setup({})

      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            luasnip.lsp_expand(args.body) -- For luasnip users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(), -- Trigger completion manually
          ['<C-e>'] = cmp.mapping.abort(),      -- Close completion window
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept selected suggestion

          -- Tab completion (Optional: Choose potentially one)
          -- If you want tab to cycle suggestions *and* fallback to snippet/completion confirm
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }), -- i: insert mode, s: select mode (for snippets)

          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
    end, { "i", "s" }),

        }),
        -- Sources for completion, order matters.
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },  -- Language Server Protocol
          { name = 'luasnip' },   -- Snippets
          { name = 'buffer' },    -- Words in current buffer
          { name = 'path' },      -- File system paths
        }),

        -- Add nice icons to the completion menu (Optional)
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol_text', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from becoming too wide
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
            -- Show source name for each completion item (Optional)
            -- before = function (entry, vim_item)
            --   vim_item.menu = "["..string.upper(entry.source.name).."]"
            --   return vim_item
            -- end
          })
        },

        -- Optional: Add experimental features like ghost text for preview
        -- experimental = {
        --   ghost_text = true,
        -- }
      })
    end,
  },

  -- Snippet Engine (Required by cmp configuration above)
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*",
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" }, -- Optional snippets collection
    event = "InsertEnter", -- Or lazy-load when needed
    config = function()
      -- Basic LuaSnip setup (can be expanded)
       require("luasnip.loaders.from_vscode").lazy_load()
       require("luasnip").config.setup({})
    end,
  },

  -- Optional: Icons for completion items
  { "onsails/lspkind.nvim", event = "BufReadPre" }, -- Load early for icons

  -- Optional: Snippet collection
  { "rafamadriz/friendly-snippets" }

}
