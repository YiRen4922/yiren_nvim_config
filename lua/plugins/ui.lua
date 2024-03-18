return {

    -- lualine的配置
    {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function() 
        require('lualine').setup()
    end
    },
    -- barbecue配置
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = 
        {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        opts = 
        {
            -- configurations go here
        },
        config = function()
            -- catppuccin的要求
            require("barbecue").setup 
            {
                theme = "catppuccin", -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
            }
        end
    }

}
