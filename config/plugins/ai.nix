{
  mcphub-nvim,
  mcp-hub,
  lib,
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
    avante = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
      settings = {
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
  extraPackages = [mcp-hub];
  extraConfigLua = ''
    require("mcphub").setup()
  '';
}
