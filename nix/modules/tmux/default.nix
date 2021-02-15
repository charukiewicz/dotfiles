{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    extraConfig = pkgs.lib.concatStrings [
      (builtins.readFile ./tmux.conf)
    ];
  };
}
