{lib, ...}: let
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
        ignore_filetypes = ["cpp"];
        color = {
          suggestion_color = "#ffffff";
          cterm = 244;
        };
        log_level = "info";
        disable_inline_completion = false;
        disable_keymaps = false;
        condition = mkRaw ''
          function()
            return false
          end
        '';
      };
    };
    avante = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
      settings = {
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
}
