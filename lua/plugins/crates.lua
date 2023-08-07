return {
  {
    "saecki/crates.nvim",
    ft = { "toml" },
    config = function(_, opts)
      require("crates").setup({
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
      })
      local crates = require("crates")
      crates.setup(opts)
      require("cmp").setup.buffer({
        sources = { { name = "crates" } },
      })
      crates.show()
      -- vim.keymap.set("n", "<leader>rcu", "lua require('crates').upgrade_all_crates()", { desc = "update crats" })
      vim.keymap.set("n", "<leader>ct", crates.toggle, { desc = "Enable or disable UI elements" })
      vim.keymap.set("n", "<leader>cr", crates.reload, { desc = "Reload data (clears cache)" })

      vim.keymap.set("n", "<leader>cv", crates.show_versions_popup, { desc = "show versions" })
      vim.keymap.set("n", "<leader>cf", crates.show_features_popup, { desc = "show features" })
      vim.keymap.set("n", "<leader>cd", crates.show_dependencies_popup, { desc = "show dep" })
      vim.keymap.set("n", "<leader>cu", crates.update_crate, { desc = "Update the crate" })
      vim.keymap.set(
        "v",
        "<leader>cu",
        crates.update_crates,
        { desc = "Update the crates on the lines visually selected" }
      )
      vim.keymap.set("n", "<leader>ca", crates.update_all_crates, { desc = "Update all crates in the buffer" })
      vim.keymap.set("n", "<leader>cU", crates.upgrade_crate, { desc = "update crates" })
      vim.keymap.set("v", "<leader>cU", crates.upgrade_crates, { desc = "update crates that are selected " })
      vim.keymap.set("n", "<leader>cA", crates.upgrade_all_crates, { desc = "update all crates in the buffer" })

      vim.keymap.set(
        "n",
        "<leader>ce",
        crates.expand_plain_crate_to_inline_table,
        { desc = "Expand a plain crate declaration into an inline table" }
      )
      vim.keymap.set(
        "n",
        "<leader>cE",
        crates.extract_crate_into_table,
        { desc = "Extract an crate declaration from a dependency section into a table" }
      )

      vim.keymap.set("n", "<leader>cH", crates.open_homepage, { desc = "crate Homepage" })
      vim.keymap.set("n", "<leader>cR", crates.open_repository, { desc = "crate Repository" })
      vim.keymap.set("n", "<leader>cD", crates.open_documentation, { desc = "crate documentation" })
      vim.keymap.set("n", "<leader>cC", crates.open_crates_io, { desc = "crate crates_io" })
    end,
  },
}
