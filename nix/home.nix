{ config, pkgs, ... }:
let
  nixpkgs-unstable = import <nixos-unstable> {
    overlays = [
      # (import ./overlays/...)
    ];
  };
in

{

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.bash.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "christian";
  home.homeDirectory = "/home/christian";
  home.sessionVariables = ({
    EDITOR = "vim";
  } // (import ./secret.nix).sessionVariables);
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
  home.stateVersion = "21.11";

  imports = [
    ./modules/vim
  ];

  home.packages = with pkgs; [
      cloc
      bat
      jq
      tree
      irssi

      awscli2

      gnumake

      haskellPackages.stylish-haskell
      haskellPackages.hasktags
      stack
      cachix
  ];

  programs.bash = {
    initExtra = builtins.readFile ../bash/custom_prompt.sh;
    shellAliases = {
      mkhasktags = "find . -name *.hs | hasktags -cxL STDIN";
    };
  };

}
