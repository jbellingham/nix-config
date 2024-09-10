{
  config,
  pkgs,
  ...
}:
let
  gnomeExtensions = with pkgs.gnomeExtensions; [
      blur-my-shell
      pano
      gsconnect
      dash-to-dock
      removable-drive-menu
      bluetooth-quick-connect
      # sound-output-device-chooser
      coverflow-alt-tab
      panel-corners
      rounded-window-corners
      rounded-window-corners
      vitals
      just-perfection
      caffeine
      user-themes
      user-themes-x
      tactile
    ];
 in {

  home-manager.users.${config.users.user.name} = {
    home.packages = with pkgs; [
      gtk-engine-murrine
    ] ++ gnomeExtensions;

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

        "org/gnome/desktop/background" = {
          color-shading-type = "solid";
          picture-options = "zoom";
          picture-uri = "file:///home/jesse/.local/share/backgrounds/alex-knight-Ys-DBJeX0nE-unsplash.jpg";
          picture-uri-dark = "file:///home/jesse/.local/share/backgrounds/alex-knight-Ys-DBJeX0nE-unsplash.jpg";
          primary-color = "#000000000000";
          secondary-color = "#000000000000";
        };

        "org/gnome/desktop/screensaver" = {
          color-shading-type = "solid";
          picture-options = "zoom";
          picture-uri = "file:///home/jesse/.local/share/backgrounds/alex-knight-Ys-DBJeX0nE-unsplash.jpg";
          primary-color = "#000000000000";
          secondary-color = "#000000000000";
        };

        "org/gnome/settings-daemon/plugins/color" = {
          night-light-enabled = true;
          night-light-schedule-automatic = true;
          night-light-temperature = 2700;
        };

        "org/gnome/desktop/interface".color-scheme = "prefer-dark";
        "org/gnome/shell/extensions/user-theme-x" = {
          x-color = "prefer-dark";
        };

        "org/gnome/shell".favorite-apps = [
          "brave-browser.desktop"
          "md.obsidian.Obsidian.desktop"
          "com.spotify.Client.desktop"
          "code.desktop"
          "org.gnome.Console.desktop"
          "net.lutris.Lutris.desktop"
          "me.hyliu.fluentreader.desktop"
        ];

        # Enable installed extensions
        "org/gnome/shell".enabled-extensions = map (extension: extension.extensionUuid) gnomeExtensions;

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
          panel-corner-radius = 12;
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
          clock-menu-position = 2;
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
          apply-custom-theme = true;
          custom-theme-shrink = true;
        };

        "org/gnome/desktop/wm/preferences".button-layout = "close,minimize";

        "org/gnome/shell/extensions/tactile" = {
          gap-size = 15;
          border-size = 5;
          # Layout 1 - vertical split screen
          col-0 = 1;
          col-1 = 1;
          row-0 = 1;

          # Layout 2
          layout-2-col-0 = 1;
          layout-2-col-1 = 2;
          layout-2-col-2 = 1;
          layout-2-row-0 = 1;
          layout-2-row-1 = 1;
        };

        "org/gnome/shell" = {
          favourite-apps = [
            "firefox.desktop"
            "spotify.desktop"
            "md.obsidian.Obsidian.desktop"
            "com.discordapp.Discord.desktop"
            "code.desktop"
            "org.wezfurlong.wezterm.desktop"
            "md.obsidian.Obsidian.desktop"
            "net.lutris.Lutris.desktop"
          ];
        };

        "org/gnome/shell/extensions/caffeine" = {
          show-indicator = "always";
          show-timer = "true";
        };
      };
    };
  };
}