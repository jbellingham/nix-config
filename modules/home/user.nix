{
  lib,
  config,
  pkgs,
  ...
}:
let
  inherit (lib)
    types
    mkDefault
    ;

  cfg = config.user;

  is-linux = pkgs.stdenv.isLinux;
  is-darwin = pkgs.stdenv.isDarwin;

  home-directory =
    if cfg.name == null then
      null
    else if is-darwin then
      "/Users/${cfg.name}"
    else
      "/home/${cfg.name}";
in with lib;
{
  options.user = {
    name = mkOption {
      type = types.str;
      default = "jesse";
    };

    fullName = mkOption {
      type = types.str;
      default = "Jesse Bellingham";
    };
    
    email = mkOption {
      type = types.str;
      default = "5078290+jbellingham@users.noreply.github.com";
    };

    home = mkOption {
      type = types.str;
      default = home-directory;
    };
  };

  config = {
    home = {
      username = mkDefault cfg.name;
      homeDirectory = mkDefault cfg.home;
    };
  };
}
