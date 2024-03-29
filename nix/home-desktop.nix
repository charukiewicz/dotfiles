{ config, pkgs, ... }:
let
  nixpkgs-unstable = import <nixpkgs-unstable> {
    overlays = [
      # (import ./overlays/...)
      #(import ./overlays/ticker)
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
  home.sessionVariables = ({
    EDITOR = "vim";
  } // (import ./secret.nix).sessionVariables);

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  home.activation = {
    stylishHaskellCfg = ''
        ln -sf ~/dotfiles/haskell/stylish-haskell.yaml ~/.stylish-haskell.yaml
      '';
  };

  imports = [
    ./modules/bash
    ./modules/vim
    ./modules/tmux
    ./modules/git
  ];

  # Use the native 'man' to avoid issues with locale
  programs.man.enable = false;

  home.packages = with pkgs; [
    jq
    nq
    yarn
    yaml2json
    bat
    awscli2

    hledger
    hledger-ui
    hledger-web

    elmPackages.elm

    nixpkgs-unstable.ticker

    nixpkgs-unstable.nix-prefetch-git

    nixpkgs-unstable.haskellPackages.cabal-install
    nixpkgs-unstable.haskellPackages.cabal2nix
    nixpkgs-unstable.haskellPackages.ghcid
    nixpkgs-unstable.haskellPackages.hasktags
    nixpkgs-unstable.haskellPackages.stylish-haskell

  ];

}
