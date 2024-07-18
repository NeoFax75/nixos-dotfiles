{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      abduco
      age
      aria2
      bat
      bc
      bottom
      entr
      fd
      file
      fossil
      ijq
      joshuto
      jq
      lazydocker
      lazygit
      moreutils
      trash-cli
      unzip
      usbutils
      wget
    ];
    sessionVariables = {
      LESS_TERMCAP_mb = "$(tput bold; tput setaf 2)";
      LESS_TERMCAP_md = "$(tput bold; tput setaf 6)";
      LESS_TERMCAP_me = "$(tput sgr0)";
      LESS_TERMCAP_so = "$(tput bold; tput setaf 3; tput setab 4)";
      LESS_TERMCAP_se = "$(tput rmso; tput sgr0)";
      LESS_TERMCAP_us = "$(tput smul; tput bold; tput setaf 7)";
      LESS_TERMCAP_ue = "$(tput rmul; tput sgr0)";
      LESS_TERMCAP_mr = "$(tput rev)";
      LESS_TERMCAP_mh = "$(tput dim)";
      LESS_TERMCAP_ZN = "$(tput ssubm)";
      LESS_TERMCAP_ZV = "$(tput rsubm)";
      LESS_TERMCAP_ZO = "$(tput ssupm)";
      LESS_TERMCAP_ZW = "$(tput rsupm)";
      LESS = "--quit-if-one-screen";
    };
  };

  programs = {
    eza = {
      enable = true;
      enableZshIntegration = true;
    };
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [
          "git"
          "npm"
          "history"
          "node"
          "rust"
          "deno"
        ];
      };
    };
    fzf.enable = true;
    fzf.enableZshIntegration = true;
    git = {
      enable = true;
      delta.enable = true;
      signing = {
        signByDefault = true;
        key = null;
      };
    };
    gpg.enable = true;
    home-manager.enable = true;
    ssh = {
      enable = true;
    };
    tealdeer = {
      enable = true;
      settings = {
        auto_update = true;
      };
    };
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
  };
}