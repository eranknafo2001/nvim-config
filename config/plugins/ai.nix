_: {
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
