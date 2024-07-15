{ config, pkgs, stylix, ... }:

{
  home.username = "neofax";
  home.homeDirectory = "/home/neofax";
  home.stateVersion = "24.05";

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      fira-code
      fira-code-symbols
      font-awesome
      (nerdfonts.override {fonts = ["FiraCode"];})
    ];

    fontconfig = {
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
  };

  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  home.packages = with pkgs; [
    asciiquarium
    bat
    bat
    bazecor
    bottom
    brave
    cachix
    cargo
    celluloid
    chatterino2
    cmatrix
    coursier
    cowsay
    delta
    direnv
    dmenu
    doppler
    duf
    dunst
    elinks
    eww
    fd
    feh
    figlet
    firefox
    flameshot
    flatpak
    fontconfig
    freetype
    fuse-common
    fx
    fzf
    gcc
    gh
    git
    github-desktop
    glow
    gnome.gnome-keyring
    gnugrep
    gnugrep
    gnumake
    gparted
    graalvm-ce
    graphviz
    gum
    heroku
    htop
    hugo
    ipfetch
    keychain
    kitty
    less
    libverto
    lolcat
    luarocks
    lxappearance
    mangohud
    mosh
    ncdu
    neofetch
    neovim
    nerdfonts
    nfs-utils
    ninja
    nix-direnv
    nodejs
    nomacs
    ookla-speedtest
    pavucontrol
    picom
    polkit_gnome
    powershell
    protonup-ng
    pulumi
    python.pkgs.pip
    python3Full
    ripgrep
    ripgrep-all
    rofi
    scala-cli
    sl
    st
    starship
    stdenv
    stow
    swaycons
    sxhkd
    synergy
    terminus-nerdfont
    tig
    tldr
    trash-cli
    tree
    unzip
    variety
    vim
    w3m
    wget
    wl-clipboard
    xclip
    xdg-desktop-portal-gtk
    xfce.thunar
    xorg.libX11
    xorg.libX11.dev
    xorg.libxcb
    xorg.libXft
    xorg.libXinerama
    xorg.xinit
    xorg.xinput
    zoxide
    zsh
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nano";
  };

  programs.home-manager.enable = true;
}
