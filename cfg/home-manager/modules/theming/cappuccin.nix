{ pkgs, lib, ... }:

{
  catppuccin = {
    enable = true;
    autoEnable = true;
    flavor = "mocha";
    accent = "mauve";
  };

  catppuccin.kvantum.enable = true;
  catppuccin.cursors.enable = true;
  home.pointerCursor.enable = true;

  home.packages = [
    (pkgs.catppuccin-gtk.override {
      accents = [ "mauve" ];
      variant = "mocha";
    })
  ];

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  gtk = {
    enable = true;
    iconTheme.name = lib.mkForce "Papirus-Dark";

    font = {
      name = "Inter Variable Black";
      size = 14;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
      gtk-decoration-layout = "icon:minimize,maximize,close";
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintfull";
      gtk-xft-rgba = "rgb";
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintfull";
      gtk-xft-rgba = "rgb";
    };
  };
}
