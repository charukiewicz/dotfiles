{ pkgs, ... }:
{
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
    quick-scope
  ];
  extraConfig = ''
      source ~/.vimrc
    '';
}
