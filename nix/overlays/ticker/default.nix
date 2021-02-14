self : super :
{
  ticker = super.stdenv.mkDerivation {
    name = "ticker";

    src = builtins.fetchurl {
      url =
        let version = "2.0.3";
        in "https://github.com/achannarasappa/ticker/releases/download/v${version}/ticker-${version}-linux-amd64.tar.gz";
      sha256 = "1gx6iysly94inkrvxxhpanzf9rpjg89fgq95vna0g31kgg232ikx";
    };

    unpackPhase = ''
        tar -xf $src
      '';

    dontBuild = true;

    installPhase = ''
        runHook preInstall

        mkdir -p "$out/bin"
        cp ticker "$out/bin"

        runHook postInstall
      '';
  };
}
