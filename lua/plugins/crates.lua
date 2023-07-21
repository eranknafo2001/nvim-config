return {
  "saecki/crates.nvim",
  version = "v0.3.0",
  depenencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("crates").setup()
  end,
  "jose-elias-alvarez/null-ls.nvim",
}
