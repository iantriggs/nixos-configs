# Ian's NixOS configs

Based on the standard config in [nix-starter-configs](https://github.com/Misterio77/nix-starter-configs) and the [NixOS and Flakes book](https://nixos-and-flakes.thiscute.world/).

## Updating

```bash
$ sudo nix flake update
$ sudo nixos-rebuild switch --flake .
```

## Useful links

- [NixOS package search](https://search.nixos.org/packages)
- [NixOS options search](https://search.nixos.org/options)
- [NixOS Flakes search](https://search.nixos.org/flakes)
- [home-manager options search](https://mipmip.github.io/home-manager-option-search/)
- [NixOS Wiki](https://nixos.wiki/)

## TODO:

- Drivers?
- Dev environments:
  - nix-env?
  - python
  - go
  - flutter
  - vue
  - android-studio
  - adb
  - terraform
  - ansible
- Gnome/DE settings
- zsh + oh-my-zsh + fzf
- podman/docker and k8s
- neovim/nvchad
- work laptop config
- fonts
- laptop tuning (battery, fan, etc)
- Move to this - https://github.com/frogamic/nix-machines/tree/main
