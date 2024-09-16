{
  lib,
  helpers,
  pkgs,
  ...
}:
let
  inherit (lib.nixvim) defaultNullOpts mkNullOrOption;
  inherit (lib) types;
in
lib.nixvim.neovim-plugin.mkNeovimPlugin {
  name = "tailwind-tools";
  originalName = "tailwind-tools.nvim";
  package = "tailwind-tools-nvim";
  extraPackages = with pkgs; [
    tailwindcss-language-server
  ];

  maintainers = [ lib.maintainers.alisonjenkins ];

  settingsOptions = {
    # server =
    #   defaultNullOpts.mkAttrsOf
    #     (types.submodule {
    #       freeformType = with types; attrsOf anything;
    #
    #       options = {
    #         override = mkNullOrOption types.anything ''
    #           Setup the server from the plugin if true.
    #         '';
    #
    #         settings = mkNullOrOption types.anything ''
    #           Shortcut for settings.tailwindCSS
    #         '';
    #
    #         on_attach = mkNullOrOption types.anything ''
    #           The on attach function for the LSP.
    #         '';
    #       };
    #     })
    #     ''
    #       The server section is used for configuring the TailwindCSS LSP.
    #     '';

    document_color = {
      enabled = lib.mkOption {
        description = ''
          Whether to insert the tailwindCSS colours into the document.
        '';
        type = types.bool;
        default = true;
        example = false;
      };

      kind = lib.mkOption {
        description = ''
          Where to put the colour. One of: "inline" | "foreground" | "background"
        '';
        type = types.enum [
          "inline"
          "foreground"
          "background"
        ];
        default = "inline";
        example = "background";
      };

      inline_symbol = helpers.defaultNullOpts.mkStrLuaOr types.nonEmptyStr "󰝤" ''
        The symbol to put next to the colour class to show the colour. This is only used in inline mode.
      '';
    };
    # document_color =
    #   defaultNullOpts.mkAttrsOf
    #     (types.submodule {
    #       freeformType = with types; attrsOf anything;
    #
    #       options = {
    #         inline_symbols = mkNullOrOption types.anything ''
    #           only used in inline mode
    #         '';
    #
    #         debounce = mkNullOrOption types.anything ''
    #           in milliseconds only applied in insert mode.
    #         '';
    #       };
    #     })
    #     ''
    #       Allows showing the colours inside the document near the TailwindCSS classes.
    #     '';

    conceal = {
      enabled = lib.mkOption {
        description = ''
          Whether to collapse HTML class attributes.
        '';
        type = types.bool;
        default = false;
        example = true;
      };

      min_length = helpers.defaultNullOpts.mkStrLuaOr types.ints.unsigned "nil" ''
        Only conceal classes that exceed this length.
      '';

      symbol = helpers.defaultNullOpts.mkStrLuaOr types.nonEmptyStr "󱏿" ''
        The symbol to use when collapsing the classes. Only 1 character is allowed.
      '';

      # highlight = helpers.defaultNullOpts.mkStrLuaOr types.anything ''
      #   Extmark highlight options, see :h 'highlight'
      # '';
    };

    # cmp =
    #   defaultNullOpts.mkAttrsOf
    #     (types.submodule {
    #       freeformType = with types; attrsOf anything;
    #
    #       options = {
    #         enabled = mkNullOrOption types.anything ''
    #           Colour preview style, "foreground" | "background"
    #         '';
    #       };
    #     })
    #     ''
    #       Configures the cmp integration.
    #     '';

    # telescope =
    #   defaultNullOpts.mkAttrsOf
    #     (types.submodule {
    #       freeformType = with types; attrsOf anything;
    #
    #       options = {
    #         utilities =
    #           defaultNullOpts.mkAttrsOf
    #             (types.submodule {
    #               freeformType = with types; attrsOf anything;
    #
    #               options = {
    #                 callback = mkNullOrOption types.anything ''
    #                   Callback used when selecting an utility class in Telescope.
    #                 '';
    #               };
    #             })
    #             ''
    #               Configures the utility class Telescope command.
    #             '';
    #       };
    #     })
    #     ''
    #       Configures the Telescope command.
    #     '';

    # extension =
    #   defaultNullOpts.mkAttrsOf
    #     (types.submodule {
    #       freeformType = with types; attrsOf anything;
    #     })
    #     ''
    #       See the extension section here: https://github.com/luckasRanarison/tailwind-tools.nvim?tab=readme-ov-file#extension
    #     '';
  };

  settingsExample = {
    document_color = {
      enabled = true;
      kind = "inline";
      inline_symbol = "󰝤 ";
      debounce = 200;
    };
    conceal = {
      enabled = true;
      min_length = 10;
      symbol = "󱏿";
      highlight = {
        fg = "#38BDF8";
      };
    };
    cmp = {
      highlight = "foreground";
    };
  };
}
