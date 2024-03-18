# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs
, outputs
, lib
, config
, pkgs
, commands
, ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "ian";
    homeDirectory = "/home/ian";
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  };

  # Add stuff for your user as you see fit:
  programs.neovim.enable = true;

  # Packages to install
  home.packages = with pkgs; [
    # Commandline tools
    zsh-powerlevel10k
    fzf

    # Dev
    flutter
    kubectl
    kubectx
    android-studio

    # Games
    steam

    # Gnome Extensions
    gnomeExtensions.user-themes
    # gnomeExtensions.material-shell

  ];

  # basic configuration of git
  programs.git = {
    enable = true;
    userName = "Ian Triggs";
    userEmail = "iantriggs@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.zsh = {
    enable = true;
    autosuggestion = {
      enable = true;
    };
    enableCompletion = true;
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = lib.cleanSource ./configs/p10k;
        file = "p10k.zsh";
      }
    ];
    shellAliases = {
      k = "kubectl";
      l = "ls -lah";
      ll = "ls -l";
      update = "sudo nixos-rebuild switch --flake ~/src/nixos-configs/ --show-trace";
      update-flake = "nix flake update ~/src/nixos-configs/";
      urldecode = "
        python3 - c 'import sys, urllib.parse as ul;
      print(ul.unquote_plus(sys.stdin.read()))'";
      urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";

    };
    history = {
      path = "${config.xdg.dataHome}/zsh/history";
      size = 10000;
    };
    initExtraBeforeCompInit = ''
      if [ -n ''\"''\${commands[fzf-share]}''\" ]; then
        source "$(fzf-share)/completion.zsh"
      fi 
    '';
    initExtra = ''
      if [ -n ''\"''\${commands[fzf-share]}''\" ]; then
        source "$(fzf-share)/key-bindings.zsh"
      fi 
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "zsh-interactive-cd"
        "kubectl"
        "helm"
        "minikube"
        "doctl"
        "docker"
        "docker-compose"
        "dotenv"
      ];
    };
  };


  # Gnome settings
  # Use `dconf watch /` to track stateful changes you are doing, then set them here.
  # dconf.settings = {
  #   "org/gnome/shell" = {
  #     disable-user-extensions = false;
  #     enabled-extensions = [

  #     ];
  #     favorite-apps = [
  #       "google-chrome.desktop"
  #       "org.gnome.Console.desktop"
  #       "code.desktop"
  #       "org.gnome.Nautilus.desktop"
  #       "sublime_text.desktop"
  #     ];
  #   };

  #   "org/gnome/desktop/interface" = {
  #     color-scheme = "prefer-dark";
  #   };
  #   "org/gnome/desktop/interface" = {
  #     clock-format = "12h";
  #   };
  #   "org/gtk/settings/file-chooser" = {
  #     clock-format = "12h";
  #   };

  #   "org/gnome/desktop/peripherals/touchpad" = {
  #     tap-to-click = true;
  #     natural-scroll = false;
  #   };

  #   "org/gnome/desktop/interface" = {
  #     font-antialiasing = "rgba";
  #   };
  # };



  # Enable home-manager and git
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}

