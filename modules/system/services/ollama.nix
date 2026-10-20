# modules/system/services/ollama.nix
{ config, lib, pkgs, ... }: 

{
  options.modules.services.ollama.enable = lib.mkEnableOption "Ollama service";

  config = lib.mkIf config.modules.services.ollama.enable {
    services.ollama = {
      enable = true;
    };
  };
}
