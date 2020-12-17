{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.bash.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "christian";
  home.homeDirectory = "/home/christian";
  home.sessionVariables = {
    EDITOR = "vim";
  };
  home.sessionPath = [
    "~/.local/bin"
  ] ++ (import ./secret.nix).sessionPath;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";

  home.packages = with pkgs; [
      cloc
      bat
      jq
      irssi

      awscli2

      gnumake
      haskellPackages.stylish-haskell
      stack
      cachix
  ];

  programs.vim = import ./vim.nix pkgs;
}
