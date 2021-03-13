self : super :
{
  ticker = super.stdenv.mkDerivation {
    name = "ticker";

    src = builtins.fetchurl {
      url =
        let version = "3.1.9";
        in "https://github.com/achannarasappa/ticker/releases/download/v${version}/ticker-${version}-linux-amd64.tar.gz";
      sha256 = "1z3js2b5zp49cwq8kkrfhzgizsi4f3wdwynk2az2zlpmvsn9ikrc";
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
