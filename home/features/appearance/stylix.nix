{ pkgs, inputs, ... }:

{
  imports = [ inputs.stylix.homeModules.stylix ];

  stylix = {
    enable = true;
    autoEnable = true;
    
    # Base16 Scheme
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    image = ../../../.assets/wallpapers/nix.png;

    # Cursor
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    # Fonts
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts._0xproto;
        name = "0xProto Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.nerd-fonts._0xproto;
        name = "0xProto Nerd Font";
      };
      serif = {
        package = pkgs.nerd-fonts._0xproto;
        name = "0xProto Nerd Font";
      };

      sizes = {
        terminal = 13;
      };
    };

    # Opacity (Optional)
    opacity = {
      applications = 1.0;
      terminal = 0.95;
      desktop = 1.0;
      popups = 1.0;
    };
  };
}
