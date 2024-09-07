{ ... }: {
  environment.shellAliases = {
    bu = "brew upgrade";

    # safely (moves to trash instead of immediately deleting) recursively delete all node_modules down from the call site -- uses trash cli (brew install trash)
    # -F flag asks Finder to do the trashing to allow "put back" feature
    killnm = "find . -name node_modules -type d -prune -exec trash -F {} +";
  };
}