return {
  {
    "echasnovski/mini.surround",
    enable = false,
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    dependencies = {
      "folke/flash.nvim",
    },
    config = function()
      require("nvim-surround").setup({
        keymaps = {
          visual = "s",
          visual_line = "gs",
        },
      })
    end,
  },
}
