return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        {
        	"L3MON4D3/LuaSnip",
        	-- follow latest release.
        	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        	-- install jsregexp (optional!).
        	build = "make install_jsregexp"
        },
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        require("luasnip.loaders.from_vscode").lazy_load()
        -- luasnip.

        cmp.setup{
            completion = { completeopt = "menu, menuone,noinsert", },
             snippet = {
                expand = function(args)
                  luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<Tab>'] = cmp.mapping.select_next_item(),
                ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),            --  Scroll the documentation window [b]ack
                ['<C-f>'] = cmp.mapping.scroll_docs(4),             --  Scroll the documentation window [f]orword
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
                {name = "luasnip"},
                {name = "nvim_lsp"},
                {name = "buffer"},
                {name = "path"},
            }),
        }
    end,
}
