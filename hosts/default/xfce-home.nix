{ config, pkgs, lib, ... }:

{
  gtk = {
    enable = true;
    iconTheme = {
      name = "Tokyonight-Dark";
      package = pkgs.elementary-xfce-icon-theme;
    };
    theme = lib.mkForce {
      name = "Tokyonight-Dark-B";
      package = pkgs.tokyo-night-gtk;
    };
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };
    gtk3.extraConfig = {
      gtk-decoration-layout = "menu:";
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  programs.gpg.enable = true;

  services.gpg-agent.enable = true;
}
