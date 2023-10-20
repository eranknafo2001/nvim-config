local get_logo = function()
  local logo = [[
  ▓██   ██▓ ▄▄▄       ██▀███   ██▓ ███▄    █
   ▒██  ██▒▒████▄    ▓██ ▒ ██▒▓██▒ ██ ▀█   █
    ▒██ ██░▒██  ▀█▄  ▓██ ░▄█ ▒▒██▒▓██  ▀█ ██▒
    ░ ▐██▓░░██▄▄▄▄██ ▒██▀▀█▄  ░██░▓██▒  ▐▌██▒
    ░ ██▒▓░ ▓█   ▓██▒░██▓ ▒██▒░██░▒██░   ▓██░
     ██▒▒▒  ▒▒   ▓▒█░░ ▒▓ ░▒▓░░▓  ░ ▒░   ▒ ▒
   ▓██ ░▒░   ▒   ▒▒ ░  ░▒ ░ ▒░ ▒ ░░ ░░   ░ ▒░
   ▒ ▒ ░░    ░   ▒     ░░   ░  ▒ ░   ░   ░ ░
   ░ ░           ░  ░   ░      ░           ░
   ░ ░
    ▄████  ██▀███  ▓█████ ▓█████  ███▄    █   █████▒▓█████  ██▓    ▓█████▄
   ██▒ ▀█▒▓██ ▒ ██▒▓█   ▀ ▓█   ▀  ██ ▀█   █ ▓██   ▒ ▓█   ▀ ▓██▒    ▒██▀ ██▌
  ▒██░▄▄▄░▓██ ░▄█ ▒▒███   ▒███   ▓██  ▀█ ██▒▒████ ░ ▒███   ▒██░    ░██   █▌
  ░▓█  ██▓▒██▀▀█▄  ▒▓█  ▄ ▒▓█  ▄ ▓██▒  ▐▌██▒░▓█▒  ░ ▒▓█  ▄ ▒██░    ░▓█▄   ▌
  ░▒▓███▀▒░██▓ ▒██▒░▒████▒░▒████▒▒██░   ▓██░░▒█░    ░▒████▒░██████▒░▒████▓
   ░▒   ▒ ░ ▒▓ ░▒▓░░░ ▒░ ░░░ ▒░ ░░ ▒░   ▒ ▒  ▒ ░    ░░ ▒░ ░░ ▒░▓  ░ ▒▒▓  ▒
    ░   ░   ░▒ ░ ▒░ ░ ░  ░ ░ ░  ░░ ░░   ░ ▒░ ░       ░ ░  ░░ ░ ▒  ░ ░ ▒  ▒
  ░ ░   ░   ░░   ░    ░      ░      ░   ░ ░  ░ ░       ░     ░ ░    ░ ░  ░
        ░    ░        ░  ░   ░  ░         ░            ░  ░    ░  ░   ░
                                                                    ░
        ]]

  logo = string.rep("\n", 8) .. logo .. "\n\n"

  local opts = {
    config = {
      header = vim.split(logo, "\n"),
    },
  }
  return opts
end
return {
  { "MaximilianLloyd/ascii.nvim", dependencies = {
    "MunifTanjim/nui.nvim",
  } },

  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      local get_random_ascii_art = function()
        local ascii_meneger = require("ascii")
        return ascii_meneger.get_random_global()
      end
      local opts2 = vim.tbl_deep_extend("force", opts, { config = {
        header = get_random_ascii_art(),
      } })
      return opts2
    end,
  },
}
