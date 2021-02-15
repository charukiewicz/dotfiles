{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userEmail = "charukiewicz@protonmail.com";
    userName = "charukiewicz";
    extraConfig = {
      pull = {
        rebase = "false";
      };
    };
    ignores = [
      "[._]*.s[a-v][a-z]"
      "[._]*.sw[a-p]"
      "[._]s[a-v][a-z]"
      "[._]sw[a-p]"
      "Session.vim"
    ];
  };
}
