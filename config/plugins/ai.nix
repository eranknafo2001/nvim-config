{
  mcphub-nvim,
  mcp-hub,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.nixvim) mkRaw;
in {
  plugins = {
    supermaven = {
      enable = true;
      settings = {
        keymaps = {
          accept_suggestion = "<Tab>";
          clear_suggestions = "<C-]>";
          accept_word = "<C-j>";
        };
        color = {
          suggestion_color = "#ffffff";
          cterm = 244;
        };
      };
    };
    copilot-lua = {
      enable = true;
      settings = {
        suggestion = {
          enabled = false;
        };
      };
    };
    avante = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
      settings = {
        provider = "copilot";
        providers = {
          openai-4o-mini = {
            __inherited_from = "openai";
            model = "o4-mini";
          };
          openai-4-1 = {
            __inherited_from = "openai";
            model = "gpt-4.1";
          };
          claude-4 = {
            __inherited_from = "claude";
            model = "claude-sonnet-4-20250514";
          };
        };
        system_prompt = mkRaw ''
          function()
            local hub = require("mcphub").get_hub_instance()
            return hub and hub:get_active_servers_prompt() or ""
          end
        '';
        custom_tools = mkRaw ''
          function()
            return {
                require("mcphub.extensions.avante").mcp_tool(),
            }
          end
        '';
        input = {
          provider = "snacks";
          provider_opts = {
            title = "Avante Input";
            icon = " ";
            placeholder = "Enter your API key...";
          };
        };
      };
    };
  };
  extraPlugins = [mcphub-nvim];
  extraPackages = [pkgs.bun];
  extraConfigLua = ''
    require("mcphub").setup({
        port = 3000,
        config = "${./mcphub-server.json}",
        cmd = "${mcp-hub}/bin/mcp-hub"
    })
  '';
}
