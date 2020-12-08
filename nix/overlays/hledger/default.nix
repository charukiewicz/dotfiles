self : super :
{
  all-cabal-hashes = builtins.fetchurl {
    url = "https://github.com/commercialhaskell/all-cabal-hashes/archive/b3441014539653dfd6f3ef5ff186770acfb2cf81.tar.gz";
    sha256 = "1kbccxawzxrvh666sky55493h4f9gllxwxqhaz7rpsjzfpkz27fc";
  };
  haskellPackages = super.haskellPackages.override {
    overrides = sf : su : rec {
      hledger =
        sf.callHackage "hledger" "1.20" {};
      hledger-lib =
        sf.callHackage "hledger-lib" "1.20" {};
      hledger-ui =
        sf.callHackage "hledger-ui" "1.20" {};
      hledger-web =
        sf.callHackage "hledger-web" "1.20.1" {};

      pretty-simple =
        sf.pretty-simple_4_0_0_0;
      prettyprinter =
        super.haskellPackages.prettyprinter_1_7_0;
    };
  };
}
