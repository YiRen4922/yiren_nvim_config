return {
        {
            'nvim-telescope/telescope.nvim', tag = '0.1.6',
        -- or                              , branch = '0.1.x',
            dependencies = { 
                'nvim-lua/plenary.nvim',
                {
                    'nvim-telescope/telescope-fzf-native.nvim', 
                    build = 'make' 
                },
            },
            config = function()
                local builtin = require('telescope.builtin')
                vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
                vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
                vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
                vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
                require("telescope").setup{
                      extensions = {
                          fzf = {
                            fuzzy = true,                    -- false will only do exact matching
                            override_generic_sorter = true,  -- override the generic sorter
                            override_file_sorter = true,     -- override the file sorter
                            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                                             -- the default case_mode is "smart_case"
                          }
                    }
                }
                 require('telescope').load_extension('fzf')

            end

        },
        {
            'nvim-treesitter/nvim-treesitter',
            build = ':TSUpdate',
            config = function () 
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
                sync_install = false,

                highlight = { enable = true },
                indent = { enable = true },  
              })

          end
        }
    }
