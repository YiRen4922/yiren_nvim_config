return
{
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            -- require'lspconfig'.pyright.setup{}
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")

            -- 配置不同的lsp
            mason.setup({
                ui = {
                    icons = {
                        package_installed = "✓",

                        package_pending = "➜",

                        package_uninstalled = "✗"
                    }
                }
            })
            mason_lspconfig.setup({
                ensure_installed = {
                        "lua_ls",
                        "pyright"
                    },
                })
            
            local lspconfig = require("lspconfig")
            lspconfig['pyright'].setup{}
            lspconfig['lua_ls'].setup{}
            vim.api.nvim_create_autocmd("LspAttach", 
            {
                callback = function(args)
                end
            }
            )


        end
    }
}
