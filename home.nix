{ config, pkgs, ... }:
let
  mod = "SUPER";
  terminal = "alacritty";
in
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

  # hyprland
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {

      "$terminal" = "alacritty";

      "$mod" = "SUPER";

      monitor = [",preferred,auto,1"];
      
      bind = [
        "SUPER, Q, killactive"
        "SUPER, T, exec, alacritty"
      ];

    };
  };
  
  home.stateVersion = "26.05";
}
