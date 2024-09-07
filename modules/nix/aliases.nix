{ ... }: {
  environment.shellAliases = {
    
      update = "(cd ~/nixos-config && make)";
      makespace = "(cd ~/nixos-config && make space)";
      say = "spd-say";
      pbcopy = "xsel --clipboard --input";
      pbpaste = "xsel --clipboard --output";
  };
}