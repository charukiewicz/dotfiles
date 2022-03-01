{ pkgs, ... }:
{
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins;
      let
        vim-syntax-shakespeare = pkgs.vimUtils.buildVimPlugin {
          name = "vim-syntax-shakespeare";
          src = pkgs.fetchFromGitHub {
            owner = "pbrisbin";
            repo = "vim-syntax-shakespeare";
            rev = "2f4f61eae55b8f1319ce3a086baf9b5ab57743f3";
            sha256 = "0h79c3shzf08g7mckc7438vhfmxvzz2amzias92g5yn1xcj9gl5i";
          };
        };
        vim-blade = pkgs.vimUtils.buildVimPlugin {
          name = "vim-blade";
          src = pkgs.fetchFromGitHub {
            owner = "jwalton512";
            repo = "vim-blade";
            rev = "9534101808cc320eef003129a40cab04b026a20c";
            sha256 = "1ikv3cpgnwnv8prwgin3936f74cjz3m006lvyfwd1jf3bxk8f80d";
          };
        };
        vim-urweb = pkgs.vimUtils.buildVimPlugin {
          name = "vim-urweb";
          src = pkgs.fetchFromGitHub {
            owner = "steinuil";
            repo = "urweb.vim";
            rev = "4eaf6eed7f30191897b566c173cf8332c3e02583";
            sha256 = "08fq6rd65q3jp2b66fi8c040lhnzvvbqv13px20zwyrzffxhq0b9";
          };
        };
      in
    [ # List all plugins: nix-env -f '<nixpkgs>' -qaP -A vimPlugins
      nerdtree
      syntastic
      vim-airline
      ctrlp-vim
      tabular
      elm-vim
      haskell-vim
      purescript-vim
      vim-nix
      vim-toml
      vim-syntax-shakespeare
      vim-ledger
      quick-scope
      undotree
      vim-blade
      vim-urweb
      dhall-vim
      fennel-vim
    ];
    extraConfig = pkgs.lib.concatStrings [
      ''
        set nocompatible             " be iMproved, required

        filetype plugin indent on    " required

      ''
      (builtins.readFile ./vimrc-config)
    ];
  };
}
