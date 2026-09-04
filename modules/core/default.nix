{ pkgs, ... }:
{
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Almaty";
  i18n.defaultLocale = "en_US.UTF-8";

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [ neovim git sbctl htop unzip tree file wget2 ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 2d";
  };
}



