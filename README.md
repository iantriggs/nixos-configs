# Ian's NixOS configs

Based on the standard config in [nix-starter-configs](https://github.com/Misterio77/nix-starter-configs) and the [NixOS and Flakes book](https://nixos-and-flakes.thiscute.world/).

## Updating

```bash
$ sudo nix flake update
$ sudo nixos-rebuild switch --flake .
```

## Useful links

- https://search.nixos.org/packages
- https://search.nixos.org/options
- https://search.nixos.org/flakes
- https://mipmip.github.io/home-manager-option-search/
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
- zsh + oh-my-zsh
- podman/docker and k8s
- neovim/nvchad
- work laptop config
- fonts
- laptop tuning (battery, fan, etc)
