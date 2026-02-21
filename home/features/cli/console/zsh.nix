{
  programs = {
    zsh = {
      enable = true;
      #enableCompletions = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        ll = "eza -la";
      	tr = "eza -T";

      	lap = "sudo nixos-rebuild switch --flake .#laptop";
	      desk = "sudo nixos-rebuild switch --flake .#desktop";
	
      	#gc = "~/shell_scripts/ssh-init.sh";
      	sl = "~/nix-config/scripts/sync_logseq.sh";
      	ga = "git add .";

        gpu = "amdgpu_top --gui";

        #neofetch = "fastfetch";
        ff = "fastfetch";

        ml = "cd  ~/oth/sem3/machine_learning_project/";
      };
    };
  };
}
