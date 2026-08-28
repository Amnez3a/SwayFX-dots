{ pkgs, lib, ... }:

{
  home.packages = [ pkgs.cava ];

  programs.cava = {
    enable = true;
    settings.color.theme = lib.mkForce "noctalia";
  };
}
