{ config, pkgs, lib, stylix, ... }:

{
  imports = [
    ./xfce-home.nix
    ./cli.nix
    ./nvim.nix
  ];

  home = {
    username = "neofax";
    homeDirectory = "/home/neofax";
    stateVersion = "24.05";
  };

  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = ["Noto Serif"];
        sansSerif = ["Noto Sans"];
        monospace = ["FiraCode Mono"];
      };
    };
  };

  stylix = {
    enable = true;
    image = pkgs.fetchurl {
      url = "https://www.pixelstalk.net/wp-content/uploads/2016/05/Epic-Anime-Awesome-Wallpapers.jpg";
      sha256 = "enQo3wqhgf0FEPHj2coOCvo7DuZv+x5rL/WIo4qPI50=";
    };
    # image = ./wallpaper.jpg;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-storm.yaml";
  
    fonts = {
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serif";
      };

      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Sans";
      };

      monospace = {
        package = pkgs.noto-fonts;
        name = "Noto Sans Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        applications = 12;
        desktop = 12;
        popups = 12;
        terminal = 11;
      };
    };
    targets = {
      alacritty.enable = true;
      bat.enable = true;
      btop.enable = true;
      dunst.enable = true;
      feh.enable = true;
      # firefox.profilenames = [ "default" ];
      fzf.enable = true;
      gedit.enable = true;
      gtk.enable = true;
      gtk.extraCss = ''
      '';
      # hyprland.enable = true;
      # hyprpaper.enable = true;
      kitty.enable = true;
      kitty.variant256Colors = true;
      mangohud.enable = true;
      nixvim.enable = true;
      rofi.enable = true;
      tofi.enable = true;
      vim.enable = true;
      vscode.enable = true;
      waybar.enable = true;
      waybar.enableCenterBackColors = true;
      waybar.enableRightBackColors = true;
      xfce.enable = true;
      xresources.enable = true;
      yazi.enable = true;
      zathura.enable = true;
      zellij.enable = true;
    };
  };

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    alacritty
    alacritty-theme
    asciiquarium
    celluloid
    dmenu
    dunst
    dwt1-shell-color-scripts
    eww
    feh
    flameshot
    github-desktop
    glow
    gnome.gnome-keyring
    hugo
    kitty
    lxappearance
    mangohud
    mediainfo
    mediainfo-gui
    mosh
    mtr-gui
    nitrogen
    nomacs
    pass-wayland
    picom
    rofi
    sanctity
    st
    starship
    swaycons
    sxhkd
    synergy
    variety
    wl-clipboard
    xclip
    xdg-desktop-portal-gtk
    yt-dlp

    #----=[ Fonts ]=----#
    noto-fonts
    noto-fonts-emoji
    fira-code
    fira-code-symbols
    font-awesome
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })

  ];

  home.file = {
  };

  programs = {
    alacritty = {
	    enable = true;
	    settings = {

	      window.padding = {
		      x = 2;
		      y = 2;
	      };

	      shell.program = "${pkgs.zsh}/bin/zsh";

	      cursor.style = "Beam";

	    };
    };
  };

  home.sessionVariables = {
    EDITOR = "nano";
    GTK_THEME = "Tokyonight-Dark-B";
  };

  programs.home-manager.enable = true;
}
