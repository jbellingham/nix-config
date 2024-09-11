{ ... }:
{
  environment.shellAliases = {
    bu = "brew upgrade";

    # safely (moves to trash instead of immediately deleting) recursively delete all node_modules down from the call site -- uses trash cli (brew install trash)
    # -F flag asks Finder to do the trashing to allow "put back" feature
    killnm = "find . -name node_modules -type d -prune -exec trash -F {} +";

    # alias rm to trash cli for safer deleting
    rm = "trash -F";
    #   rm="trashy";

    # remove file from quarantine
    unquarantine = "sudo xattr -rd com.apple.quarantine";

    intellij = "open -na 'IntelliJ IDEA Ultimate.app'";
    goland = "open -na 'GoLand.app'";
    rebuildmac = "(cd ~/nixos-config && make update-mac)";
    editmac = "(code ~/nixos-config)";

    startyabai = "yabai --start-service";
    stopyabai = "yabai --stop-service";
    restartyabai = "yabai --restart-service";
  };
}
