{ ... }: {
  services.flatpak.enable = true;
  services.flatpak.packages = [
    "com.github.tchx84.Flatseal"

    # Productivity
    "md.obsidian.Obsidian"

    # Coding-related
    "org.gnome.meld"
    
    # Not sure if it's a Nix thing specifically, but using Java installed using Nix in IntelliJ doesn't seem to work out of the box.
    # The JAVA_HOME seems to get set weirdly - on a Mac it is expecting JAVA_HOME to be something like ...zulu-8.jdk/Contents/Home.
    # I get around this by just overriding it in the IntelliJ project settings (CMD + ;)
    "com.jetbrains.IntelliJ-IDEA-Community"

    "com.spotify.Client"

    # Gaming-related
    "net.lutris.Lutris"
    # "org.winehq.Wine"

    # Miscellaneous
    "de.uni_heidelberg.zah.GaiaSky" # Explore the universe in 3D

    # Social
    "com.discordapp.Discord"
    "com.slack.Slack"

    # RSS
    "me.hyliu.fluentreader"
  ];
}