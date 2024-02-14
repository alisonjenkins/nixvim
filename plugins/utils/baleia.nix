{
  helpers,
  pkgs,
  config,
  ...
}:
helpers.neovim-plugin.mkNeovimPlugin config
{
  name = "baleia";
  originalName = "baleia.nvim";
  defaultPackage = pkgs.vimPlugins.baleia-nvim;

  maintainers = [helpers.maintainers.alisonjenkins];

  settingsOptions = {
    async = helpers.defaultNullOpts.mkBool true "highlight asynchronously";
    colors = helpers.defaultNullOpts.mkStr "NR_8" "table mapping 256 color codes to vim colors";
    line_starts_at = helpers.defaultNullOpts.mkInt 1 "at which column start colorizing";
    log = helpers.defaultNullOpts.mkEnum ["ERROR" "WARN" "INFO" "DEBUG"] "INFO" "log level, possible values are ERROR, WARN, INFO or DEBUG";
    name = helpers.defaultNullOpts.mkStr "BaleiaColors" "prefix used to name highlight groups";
    strip_ansi_codes = helpers.defaultNullOpts.mkBool true "remove ANSI color codes from text";
  };

  settingsExample = {
    async = true;
    colors = "NR_8";
    line_starts_at = 1;
    log = "INFO";
    name = "BaleiaColors";
    strip_ansi_codes = true;
  };
}
