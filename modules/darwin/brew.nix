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