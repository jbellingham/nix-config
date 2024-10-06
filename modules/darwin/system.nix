{ pkgs, ... }:

###################################################################################
#
#  macOS's System configuration
#
#  All the configuration options are documented here:
#    https://daiderd.com/nix-darwin/manual/index.html#sec-options
#
###################################################################################
{
  # Remove this once updated to MacOS 15
  ids.uids.nixbld = 350;

  system = {
    # activationScripts are executed every time you boot the system or run `nixos-rebuild` / `darwin-rebuild`.
    activationScripts.postUserActivation.text = ''
      # activateSettings -u will reload the settings from the database and apply them to the current session,
      # so we do not need to logout and login again to make the changes take effect.
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';

    defaults = {
      dock = {
        autohide = true;

        # https://daiderd.com/nix-darwin/manual/index.html#opt-system.defaults.dock.wvous-bl-corner
        wvous-bl-corner = 13; # lock screen
        wvous-br-corner = null; # disabled
        wvous-tl-corner = null; # disabled
        wvous-tr-corner = null; # disabled

        largesize = 64;
        magnification = true;
      };

      finder = {
        AppleShowAllFiles = true;
        ShowStatusBar = true;
      };

      screensaver.askForPasswordDelay = 10;
      CustomUserPreferences = {
        NSGlobalDomain = {
          AppleShowAllFiles = true;
          "com.apple.swipescrolldirection" = false;
          ApplePressAndHoldEnabled = true;

          # Add a context menu item for showing the Web Inspector in web views
          WebKitDeveloperExtras = true;
        };

        "com.apple.finder" = {
          _FXSortFoldersFirst = true;
          # When performing a search, search the current folder by default
          FXDefaultSearchScope = "SCcf";
        };

        "com.apple.LaunchServices" = {
          LSQuarantine = false;
        };

        "com.apple.screencapture" = {
          location = "~/Desktop";
          type = "png";
        };

        "com.apple.WindowManager".EnableStandardClickToShowDesktop = false;

        # "com.apple.Safari" = {
        #   # Privacy: don’t send search queries to Apple
        #   UniversalSearchEnabled = false;
        #   SuppressSearchSuggestions = true;
        #   # Press Tab to highlight each item on a web page
        #   WebKitTabToLinksPreferenceKey = true;
        #   ShowFullURLInSmartSearchField = true;
        #   # Prevent Safari from opening ‘safe’ files automatically after downloading
        #   AutoOpenSafeDownloads = false;
        #   ShowFavoritesBar = false;
        #   IncludeInternalDebugMenu = true;
        #   IncludeDevelopMenu = true;
        #   WebKitDeveloperExtrasEnabledPreferenceKey = true;
        #   WebContinuousSpellCheckingEnabled = true;
        #   WebAutomaticSpellingCorrectionEnabled = false;
        #   AutoFillFromAddressBook = false;
        #   AutoFillCreditCardData = false;
        #   AutoFillMiscellaneousForms = false;
        #   WarnAboutFraudulentWebsites = true;
        #   WebKitJavaEnabled = false;
        #   WebKitJavaScriptCanOpenWindowsAutomatically = false;
        #   # "com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks" = true;
        #   # "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" = true;
        #   # "com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled" = false;
        #   # "com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled" = false;
        #   # "com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabledForLocalFiles" = false;
        #   # "com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically" = false;
        # };
      };
      # other macOS's defaults configuration.
      # ......
    };
  };

  fonts = {
    packages = [
      pkgs.hack-font
      pkgs.meslo-lg
      pkgs.meslo-lgs-nf
      pkgs.source-code-pro
    ];
  };

  # Add ability to used TouchID for sudo authentication
  security.pam.enableSudoTouchIdAuth = true;
}
