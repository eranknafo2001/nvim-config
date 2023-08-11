return {
  "code-biscuits/nvim-biscuits",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function(_, opts)
      require("nvim-biscuits").setup({
        default_config = {
          max_length = 12,
          min_distance = 5,
          prefix_string = " 📎 ",
        },
        language_config = {
          rust = {
            prefix_string = "🦀",
          },
          javascript = {
            prefix_string = " ✨ ",
            max_length = 80,
          },
          python = {
            disabled = true,
          },
        },
      })
    end,
  },
}
