return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "simrat39/rust-tools.nvim",
    init = function()
      require("lazyvim.util").on_attach(function(_, buffer)
          -- stylua: ignore
              -- Hover actions
        local rt = require("rust-tools")
        vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = buffer })
        -- Code action groups
        vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = buffer })
      end)
    end,
  },
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      -- tsserver will be automatically installed with mason and loaded with lspconfig
      rust_analyzer = {},
    },
    -- you can do any additional lsp server setup here
    -- return true if you don't want this server to be setup with lspconfig
    ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
    setup = {
      -- example to setup with typescript.nvim
      rust_analyzer = function(_, opts)
        local rust_tools_opts = vim.tbl_deep_extend("force", opts, {
          server = {
            settings = {
              ["rust-analyzer"] = {
                -- Add clippy lints for Rust.
                checkOnSave = {
                  allFeatures = true,
                  command = "clippy",
                },
                cargo = {
                  allFeatures = true,
                  loadOutDirsFromCheck = true,
                  runBuildScripts = true,
                },
                procMacro = {
                  enable = true,
                  ignored = {
                    ["async-trait"] = { "async_trait" },
                    ["napi-derive"] = { "napi" },
                    ["async-recursion"] = { "async_recursion" },
                  },
                },
              },
            },
          },
        })
        require("rust-tools").setup(rust_tools_opts)
        return true
      end,
      -- Specify * to use this function as a fallback for any server
      -- ["*"] = function(server, opts) end,
    },
  },
}
