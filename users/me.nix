{ config, pkgs, ... }: {
  users.users.me = {
    name = "ian";
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [
    ];
  };
  # TODO: Add work account for WSL
}
