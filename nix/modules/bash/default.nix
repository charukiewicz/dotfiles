{ pkgs, ... }:
{
  programs.bash = {
    enable = true;
    initExtra = builtins.readFile ./bash.bashrc;
  };
}
