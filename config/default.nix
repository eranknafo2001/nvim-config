{...}: {
  imports = [
    ./options.nix
    ./keymaps.nix
    ./autocmd.nix
    ./plugins/default.nix
  ];
  enableMan = true;
  vimAlias = true;
  clipboard.providers.wl-copy.enable = true;
  editorconfig.enable = true;
  colorschemes.tokyonight = {
    enable = true;
    settings.style = "storm";
  };
  plugins = {
    undotree.enable = true;
    lz-n.enable = true;
  };
}
