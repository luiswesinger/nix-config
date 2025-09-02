# modules/programs/kitty.nix
{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "0xProto Nerd Font Regular";
      font_size = 12.0;
      # Catpuccin colors
      include = "${pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "kitty";
        rev = "v0.1.0"; # Use a specific version
        hash = "sha256-hash-of-the-repo";
      }}/catppuccin-frappe.conf";
    };
  };
}
