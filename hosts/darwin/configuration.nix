{ pkgs, ... }:

{
  nix.settings = {
    # enable flakes globally
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  services.postgresql = {
    enable = true;
    enableTCPIP = true;
  };

  system.stateVersion = 5;
  nix.package = pkgs.nix;
}
