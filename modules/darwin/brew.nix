{ pkgs, ... }:
{
  homebrew = {
    enable = true;
    taps = [
      "homebrew/cask-fonts"
    ];
    brews = [
      "borders"
      "dep-tree"
      "direnv"
    ];
    masApps = {
      "1Password for Safari" = 1569813296;
      "Xcode" = 497799835;
    };
    casks = [
      # ---
      # Utilities
      # ---
      "1password"
      "cheatsheet"
      "docker"
      "flycut"
      "flux"
      "logi-options-plus"
      "raycast"
      "rectangle"

      # ---
      # Social
      # ---
      "discord"

      # ---
      # Browser
      # ---
      "brave-browser"
      "firefox"
      "google-chrome"
      "arc"

      # ---
      # Dev-related
      # ---
      "fork"
      "meld"
      "wezterm"
      "dbeaver-community"
      # Not sure if it's a Nix thing specifically, but using Java installed using Nix in IntelliJ doesn't seem to work out of the box.
      # The JAVA_HOME seems to get set weirdly - on a Mac it is expecting JAVA_HOME to be something like ...zulu-8.jdk/Contents/Home.
      # I get around this by just overriding it in the IntelliJ project settings (CMD + ;)
      "jetbrains-toolbox"
      "wakatime"

      # ---
      # Other
      # ---
      "notion"
      "obsidian"
      "spotify"
      "stats"

      # ---
      # Fonts
      # ---
      "font-hack-nerd-font"
      "font-jetbrains-mono-nerd-font"
      "font-monaspace"
      "font-sf-mono"
      "font-sf-pro"
      "sf-symbols"
    ];
  };
}
