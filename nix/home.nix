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
      haskellPackages.stylish-haskell
      awscli2
      stack
      gnumake
      irssi
  ];

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
      in
    [ # List all plugins: nix-env -f '<nixpkgs>' -qaP -A vimPlugins
      nerdtree
      syntastic
      vim-airline
      ctrlp-vim
      tabular
      elm-vim
      haskell-vim
      vim-nix
      vim-toml
      vim-syntax-shakespeare
      quick-scope
    ];
    extraConfig = ''
        source ~/.vimrc
      '';
  };
}
