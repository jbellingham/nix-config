{ pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    darwin.trash
  ];
}
