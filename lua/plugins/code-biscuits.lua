return {
  "code-biscuits/nvim-biscuits",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-biscuits").setup({
        default_config = {
          -- on_events = { "InsertLeave", "CursorHoldI" },
          max_length = 10,
          min_distance = 5,
          trim_by_words = true,
          prefix_string = " 📎 ",
          cursor_line_only = true,
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
