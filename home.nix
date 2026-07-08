{ config, pkgs, ... }:
{
  # git
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Jin Sei";
        email = "nils.rivaillon@protonmail.com";
      };
      init.defaultBranch = "main";
    };
  };
  
  home.stateVersion = "26.05";
}
