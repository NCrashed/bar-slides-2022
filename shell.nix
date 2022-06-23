let
  pkgs = import ./pkgs.nix { inherit config; };
  config = {
    allowBroken = true;
  };
in with pkgs; stdenv.mkDerivation rec {
  name = "slides-env";
  env = buildEnv { name = name; paths = buildInputs; };

  buildInputs = [
    nodejs
    nodePackages.gulp
  ];
}
