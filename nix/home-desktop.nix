{ config, pkgs, ... }:
let
  nixpkgs-unstable = import <nixpkgs-unstable> {
    overlays = [
      # (import ./overlays/...)
    ];
  };
in
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;


  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "christian";
  home.homeDirectory = "/home/christian";

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
    jq
    nq
    yarn
    yaml2json
    bat

    nixpkgs-unstable.awscli2

    nixpkgs-unstable.nix-prefetch-git

    nixpkgs-unstable.haskellPackages.cabal-install
    nixpkgs-unstable.haskellPackages.cabal2nix
    nixpkgs-unstable.haskellPackages.ghcid
    nixpkgs-unstable.haskellPackages.hasktags

    nixpkgs-unstable.elmPackages.elm

    nixpkgs-unstable.hledger
    nixpkgs-unstable.hledger-ui
    nixpkgs-unstable.hledger-web
  ];

  programs.vim = import ./vim.nix pkgs;
}
