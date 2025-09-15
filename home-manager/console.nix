{
  programs = {
    zsh = {
      enable = true;
      enableCompletions = true;
      syntaxHighlighting.enable = true;

      oh-my-zsh = {
        enable = true;
	plugins = [ "git" "thefuck" ];
      };

      shellAliases = {
        ll = "eza -l";
	update = "sudo nixos-rebuild switch --flake .#";
	home = "home-manager switch --flake .#";
      };
    };

    starship = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;

      settings = {
        character = {
          success_symbol = "[›](bold green)";
          error_symbol = "[›](bold red)";
        };  
      };
    };
  };
}


