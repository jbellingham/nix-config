{ config, pkgs, ... }:
{
  home-manager.users.${config.users.user.name} = {
    programs.chromium = {
      enable = true;
      package = pkgs.brave;
      extensions = [
        { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock origin
        { id = "aeblfdkhhhdcdjpifhhbdiojplfjncoa"; } # 1 Password
        { id = "fmkadmapgofadopljbjfkapdkoienihi"; } # React Dev Tools
        { id = "bkdgflcldnnnapblkhphbgpggdiikppg"; } # DuckDuckGo Privacy Essentials
      ];
      commandLineArgs = [
        # https://support.google.com/meet/thread/211083672/automatic-microphone-volume-changes?hl=en
        "--disable-features=WebRtcAllowInputVolumeAdjustment"
      ];
    };
  };
}
