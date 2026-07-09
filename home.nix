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
    configType = "lua";

    settings = {

      monitor = [
        output = "";
        mode = "preferred";
        position = "auto";
        scale = "1";
      ];
      
      bind = [
        (bind "SUPER + Q" dsp.close)
        (bind "SUPER + T" (dsp.exec "alacritty"))
      ];

    };
  };
  
  home.stateVersion = "26.05";
}
