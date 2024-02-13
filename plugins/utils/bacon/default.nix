{
  helpers,
  pkgs,
  config,
  ...
}:
helpers.neovim-plugin.mkNeovimPlugin config
{
  name = "bacon";
  defaultPackage = pkgs.vimPlugins.nvim-bacon;
  maintainers = [helpers.maintainers.alisonjenkins];
  settingsOptions = import ./options.nix {inherit helpers;};

  settingsExample = {
    quickfix = {
      enabled = false;
      event_trigger = true;
    };
  };
}
