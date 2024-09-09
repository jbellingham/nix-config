{ pkgs, ...}: {
  homebrew = {
    enable = true;
    taps = [
        "FelixKratz/formulae"
        "homebrew/cask-fonts"
        "koekeishiya/formulae"
    ];
    brews = [
        "borders"
        "dep-tree"
        "direnv"
        "lua"
        "nowplaying-cli"
        # brew services start sketchybar
        "sketchybar"
        "switchaudio-osx"
        "yabai"
    ];
    masApps = {
        "1Password for Safari" = 1569813296;
        # "Xcode" = 497799835;
    };
    casks = [
        # ---
        # GUI Apps
        # ---
        "1password"
        "brave-browser"
        "cheatsheet"
        "dbeaver-community"
        "discord"
        "docker"
        "flux"
        "fork"
        "firefox"
        "google-chrome"

        # Not sure if it's a Nix thing specifically, but using Java installed using Nix in IntelliJ doesn't seem to work out of the box.
        # The JAVA_HOME seems to get set weirdly - on a Mac it is expecting JAVA_HOME to be something like ...zulu-8.jdk/Contents/Home.
        # I get around this by just overriding it in the IntelliJ project settings (CMD + ;)
        "jetbrains-toolbox"
        "logi-options-plus"
        "notion"
        "obsidian"
        "raycast"
        "rectangle"
        "spotify"
        "stats"
        "visual-studio-code"
        "wakatime"
        "wezterm"

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