{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    foot
  ];

  programs.foot = {
    enable = true;
    settings = {
      main = {
        include = lib.mkForce "~/.config/foot/themes/noctalia";
        font = "Iosevka Heavy Extended Oblique:size=15";
        pad = "10x10 center";
        term = "xterm-256color";
      };
      cursor = {
        style = "beam";
        blink = "no";
      };
      mouse.hide-when-typing = "yes";
      scrollback = {
        lines = 10000;
        multiplier = 5.0;
      };
      key-bindings = {
        clear-viewport = "Control+l";
        scrollback-clear = "Control+Shift+l";
        clipboard-copy = "Control+Shift+c";
        clipboard-paste = "Control+Shift+v";
        font-increase = "Control+plus";
        font-decrease = "Control+minus";
        font-reset = "Control+0";
        scrollback-up-line = "Control+k";
        scrollback-down-line = "Control+j";
        scrollback-up-page = "Control+h";
        scrollback-down-page = "Control+l";
        pipe-scrollback = "[less +G -R] Control+Shift+h";
      };
      bell = {
        urgent = "yes";
        notify = "yes";
      };
    };
  };
}
