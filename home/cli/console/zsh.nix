{
  programs = {
    zsh = {
      enable = true;
      #enableCompletions = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        ll = "eza -l";
	tr = "eza -T";

	unisys = "sudo nixos-rebuild switch --flake .#uni";
	unihome = "home-manager switch --flake .#luis@uni";

	gc = "~/./ssh-init.sh";
	ga = "git add .";
      };
    };
  };
}
