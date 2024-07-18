{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./xfce.nix
      inputs.home-manager.nixosModules.default
    ];

  # boot.kernelPackages = pkgs.linuxPackages_latest;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixie"; # Define your hostname.
  networking.networkmanager.enable = true;
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
  #  keyMap = "us";
    useXkbConfig = true; # use xkb.options in tty.
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  virtualisation.virtualbox.guest.enable = true;
  # virtualisation.virtualbox.guest.x11 = true;
  security.rtkit.enable = true;
  services = {
    blueman.enable = true;
    xserver = {
      enable = true;
      displayManager = {
        lightdm.enable = true;
        defaultSession = "xfce";
      };
      xkb.layout = "us";
      desktopManager.xfce.enable = true;
      windowManager.qtile.enable = true;
    };
    printing.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
      wireplumber.configPackages = [
        (pkgs.writeTextDir "share/wireplumber/wireplumber.conf.d/10-bluez.conf" ''
          monitor.bluez.properties = {
            bluez5.roles = [ a2dp_sink a2dp_source bap_sink bap_source hsp_hs hsp_ag hfp_hf hfp_ag ]
            bluez5.codecs = [ sbc sbc_xq aac ]
            bluez5.enable-sbc-xq = true
            bluez5.hfphsp-backend = "native"
          }
        '')
      ];
    };
    openssh.enable = true;

  };
  
  users.users.neofax = {
    isNormalUser = true;
    extraGroups = [ 
      "audio"
      "networkmanager" 
      "sshd" 
      "video" 
      "vboxsf"
      "wheel" 
    ];
    shell = pkgs.zsh;
  };

  users.defaultUserShell = pkgs.zsh;
  # environment.shells = with pkgs; [ zsh ];

  programs = {
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    zsh.enable = true;
  };

  #----=[ System-Wide Packages ]=----#
  environment.systemPackages = with pkgs; [
    bacon
    bat
    borgbackup
    bottom
    brave
    cachix
    cargo
    cargo-edit
    cargo-feature
    cargo-info
    cargo-license
    cargo-tarpaulin
    choose
    clippy
    cmatrix
    colorpanes
    cowsay
    delta
    deno
    dig
    direnv
    diskonaut
    duf
    elinks
    eza
    fastfetch
    fd
    fdupes
    ffmpeg
    figlet
    file
    firefox
    flatpak
    fontconfig
    freetype
    fuse-common
    fx
    fzf
    gcc
    gcc14
    gdu
    gh
    git
    gnugrep
    gnumake
    gparted
    graalvm-ce
    graphviz
    gum
    hdparm
    hexyl
    htop
    httpie
    hwinfo
    iamb
    imagemagick
    ipfetch
    jpegoptim
    jq
    keychain
    killall
    less
    libverto
    lightdm
    litecli
    lolcat
    luarocks
    lychee
    mtr
    nano
    ncdu
    neofetch
    neovim
    nerdfonts
    nfs-utils
    ninja
    nix-direnv
    nix-init
    nixpkgs-review
    nix-search-cli
    nix-tree
    nodejs
    npm-check-updates
    nvd
    onefetch
    ookla-speedtest
    p7zip
    pass
    pavucontrol
    polkit_gnome
    powershell
    protonup-ng
    python3Full
    rclone
    recode
    restic
    ripgrep
    ripgrep-all
    rmlint
    rsync
    rustc
    rustfmt
    scc
    sd
    sl
    smartmontools
    sox
    stow
    stress
    tectonic
    terminus-nerdfont
    tig
    timg
    tldr
    trash-cli
    trashy
    tree
    treefmt
    unar
    unzip
    usbutils
    vim
    w3m
    wget
    whois
    xorg.libX11
    xorg.libX11.dev
    xorg.libxcb
    xorg.libXft
    xorg.libXinerama
    xorg.xinit
    xorg.xinput
    yazi
    zellij
    zoxide
    zsh

  ];

  #----=[ Fonts ]=----#
    # fonts.fontconfig.enable = true;
      # home.packages = with pkgs; [
        # noto-fonts
        # noto-fonts-emoji
        # fira-code
        # fira-code-symbols
        # font-awesome
        # (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
      # ];
    # fonts = {
      # fonts = with pkgs; [
        # noto-fonts
        # noto-fonts-emoji
        # fira-code
        # fira-code-symbols
        # font-awesome
        # (nerdfonts.override {fonts = ["FiraCode"];})
      # ];
      # fontconfig = {
        # enable = true;
        # defaultFonts = {
          # monospace = ["FiraCode Mono"];
          # serif = ["Noto Serif" "Source Han Serif"];
          # sansSerif = ["Noto Sans" "Source Han Sans"];
        # };
      # };
    # };
  stylix = {
    enable = true;
    image = ./wallpaper.jpg;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-storm.yaml";
    imageScalingMode = "fill";
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
      chromium.enable = true;
      console.enable = true;
      feh.enable = true;
      lightdm.enable = true;
      nixos-icons.enable = true;
      
    };
  };


  nixpkgs.config.allowUnfree = true;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  system.stateVersion = "24.05";

  home-manager = {
    # also pass inputs to home-manager modules
    extraSpecialArgs = {inherit inputs;};
    users = {
      "neofax" = import ./home.nix;
    };
  };

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

}
