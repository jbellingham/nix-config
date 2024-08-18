{
  pkgs,
  ...
}: rec {
  home.packages = with pkgs.gnomeExtensions; [
    blur-my-shell
    # pano
    gsconnect
    dash-to-dock
    removable-drive-menu
    bluetooth-quick-connect
    # sound-output-device-chooser
    coverflow-alt-tab
    panel-corners
    # rounded-window-corners
    vitals
    just-perfection
    # caffeine-ng
    user-themes
    user-themes-x
    # pop-shell
    tactile
  ];

  gtk = {
    enable = true;

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "palenight";
      package = pkgs.palenight-theme;
    };

    cursorTheme = {
      name = "Numix-Cursor";
      package = pkgs.numix-cursor-theme;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  home.sessionVariables.GTK_THEME = "palenight";

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
      # Enable installed extensions
      "org/gnome/shell".enabled-extensions = map (extension: extension.extensionUuid) home.packages;

      "org/gnome/shell".disabled-extensions = [ ];

      "org/gnome/shell/extensions/user-theme" = {
        name = "palenight";
      };

      # Configure blur-my-shell
      "org/gnome/shell/extensions/blur-my-shell" = {
        brightness = 0.85;
        dash-opacity = 0.25;
        sigma = 15; # Sigma means blur amount
        static-blur = true;
      };
      "org/gnome/shell/extensions/blur-my-shell/panel".blur = true;
      "org/gnome/shell/extensions/blur-my-shell/appfolder" = {
        blur = true;
        style-dialogs = 0;
      };

      # Configure GSConnect
      "org/gnome/shell/extensions/gsconnect".show-indicators = true;

      # Configure Pano
      "org/gnome/shell/extensions/pano" = {
        global-shortcut = ["<Super>comma"];
        incognito-shortcut = ["<Shift><Super>less"];
      };

      # Configure Bluetooth Quick Connect
      "org/gnome/shell/extensions/bluetooth-quick-connect" = {
        keep-menu-on-toggle = false;
        refresh-button-on = true;
      };

      # Configure Panel Corners
      "org/gnome/shell/extensions/panel-corners" = {
        panel-corner-background-color = "rgb(0,0,0)";
        panel-corner-opacity = 1;
        panel-corners = true;
        screen-corners = true;
      };

      # Configure Rounded Window Corners
      "org/gnome/shell/extensions/rounded-window-corners" = {
        tweak-kitty-terminal = true;
      };

      "org/gnome/shell/extensions/vitals" = {
        show-battery = true;
        hot-sensors = [
            "_memory_usage_"
            "_processor_usage_"
            "_battery_state_"
            "_battery_rate_"
        ];
      };

      "org/gnome/shell/extensions/just-perfection" = {
        app-menu = false;
        activities-button = true;
        workspace = true;
        workspace-switcher-should-show = true;
        window-picker-icon = true;
        startup-status = 0;
        dash = true;
        panel = true;
        search = true;
        show-apps-button = true;
      };

      "org/gnome/shell/extensions/dash-to-dock" = {
        dock-fixed = true;
        multi-monitor = true;
        dock-position = "LEFT";
        click-action = "focus-minimize-or-previews";
        scroll-action = "cycle-windows";
      };

      "org/gnome/desktop/wm/preferences".button-layout = "close,minimize";

      # "org/gnome/shell/extensions/pop-shell" = {
      #   tile-by-default = false;
      #   active-hint = true;
      # };

      "org/gnome/shell/extensions/tactile" = {
        gap-size = 5;
        border-size = 5;
        col-0 = 1;
        col-1 = 3;
        col-2 = 1;
        row-0 = 1;
        row-1 = 1;
      };

      "org/gnome/shell" = {
        favourite-apps = [
          "firefox.desktop"
          "spotify.desktop"
          "com.discordapp.Discord.desktop"
          "code.desktop"
          "org.gnome.Terminal.desktop"
          "md.obsidian.Obsidian.desktop"
          "net.lutris.Lutris.desktop"
        ];
      };
    };
  };
}