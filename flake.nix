{
  description = "lunik1's NUR repository";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs@{ self, ... }:
    with inputs;
    flake-utils.lib.eachSystem [ "x86_64-linux" "i686-linux" "x86_64-darwin" "aarch64-linux" "armv6l-linux" "armv7l-linux" ] (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        packages = import ./default.nix { inherit pkgs; };
      }
    );
}
