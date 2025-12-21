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
	      desksys = "sudo nixos-rebuild switch --flake .#desktop";
	
      	gc = "~/shell_scripts/ssh-init.sh";
      	sl = "~/shell_scripts/sync_logseq.sh";
      	ga = "git add .";
      };
    };
  };
}
