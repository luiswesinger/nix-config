{
  programs = {
    zsh = {
      enable = true;
      #enableCompletions = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        ll = "eza -l";
	tr = "eza -T";

	lapsys = "sudo nixos-rebuild switch --flake .#laptop";
	laphome = "home-manager switch --flake .#luis@laptop";

	desksys = "sudo nixos-rebuild switch --flake .#desktop";
	deskhome = "home-manager switch --flake .#luis@desktop";
	
	gc = "~/shell_scripts/ssh-init.sh";
	sl = "~/shell_scripts/sync_logseq.sh";
	ga = "git add .";
      };
    };
  };
}
