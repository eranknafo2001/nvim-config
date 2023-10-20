return {
  "folke/flash.nvim",
  event = "VeryLazy",
  enabled = true,
  ---@type Flash.Config
  opts = {},
  keys = {
    -- {
    --   "s",
    --   mode = { "n" },
    --   function()
    --     require("flash").jump()
    --   end,
    --   desc = "Flash",
    -- },
    -- {
    --   "S",
    --   mode = { "n" },
    --   function()
    --     require("flash").treesitter()
    --   end,
    --   desc = "Flash Treesitter",
    -- },
    {
      "r",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
    {
      "R",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Flash Treesitter Search",
    },
    {
      "<c-s>",
      mode = { "c" },
      function()
        require("flash").toggle()
      end,
      desc = "Toggle Flash Search",
    },
  },
}
