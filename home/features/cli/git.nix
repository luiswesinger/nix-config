# home/features/cli/git.nix
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "luis";
        email = "wesingerluis@gmail.com";
      };
    };
  };
}
