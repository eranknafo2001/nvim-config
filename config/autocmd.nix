{lib, ...}: let
  inherit (lib.nixvim) mkRaw;
in {
  autoCmd = [
    {
      event = ["FileType"];
      pattern = ["qf" "help" "man" "lspinfo" "spectre_panel" "DressingSelect"];
      desc = "Quick close for some windows";
      group = "my";
      callback = mkRaw ''
        function()
          vim.keymap.set('n', 'q', ':q<CR>', { buffer = true, silent = true })
        end
      '';
    }
  ];
  autoGroups.my.clear = true;
}
