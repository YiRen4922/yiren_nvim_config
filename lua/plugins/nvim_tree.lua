return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}
    vim.api.nvim_create_user_command('Ex', function() vim.cmd.NvimTreeToggle() end, {})
  end,

}
