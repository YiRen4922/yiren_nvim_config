return 
{
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require('gitsigns').setup()
            -- 快捷键
            -- vim.keymap.set("n", "<leader>gp", ":Gitsign preview_hunk<CR>", {})
        end
    },
    {
        "tpope/vim-fugitive" 
    }
}
