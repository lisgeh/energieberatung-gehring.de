with (import <nixpkgs> {});
let env = bundlerEnv {
    name = "pg";
    inherit ruby;
    gemfile = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset = ./gemset.nix;
  };
in stdenv.mkDerivation {
  name = "pg";
  buildInputs = [env bundler ruby zlib libxml2];
}
