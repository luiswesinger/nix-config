{
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      autocd = true;

      shellAliases = {
        # File/Directory Listing
        ll = "eza -la";
        tr = "eza -T";
        l = "eza -lh --icons";
        y = "yazi";

        # Safety
        cp = "cp -i";
        mv = "mv -i";

        # Modern Replacements
        grep = "rg";
        top = "btop";
        _ = "sudo";

        # NixOS Management
        lap = "sudo nixos-rebuild switch --flake .#laptop";
        desk = "sudo nixos-rebuild switch --flake .#desktop";
        ns = "nix-shell";
        nd = "nix develop";
        nb = "nix build";
        nr = "nix run";
        ncg = "nix-collect-garbage -d";

        # Git
        ga = "git add .";
        gst = "git status";
        gcm = "git commit -m";
        gp = "git push";
        gpl = "git pull";
        gcl = "git clone";
        gl = "git log --oneline --graph --decorate --all";

        # Navigation
        ".." = "cd ..";
        "..." = "cd ../..";
        "...." = "cd ../../..";
        "....." = "cd ../../../..";

        # Hardware/Tools
        gpu = "amdgpu_top --gui";
        ff = "fastfetch";
        sl = "~/nix-config/scripts/sync_logseq.sh";

        # Utilities
        untar = "tar -xvf";
        mkd = "mkdir -p";

        # Directory-Shortcuts
        conf = "cd ~/nix-config/";
        pg2 = "cd ~/oth/sem2/pg2/";
      };
    };
  };
}
