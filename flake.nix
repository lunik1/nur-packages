{
  description = "lunik1's NUR repository";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs-lint = {
      url = "github:nix-community/nixpkgs-lint";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        utils.follows = "flake-utils";
      };
    };
  };

  outputs = inputs@{ self, ... }:
    with inputs;
    flake-utils.lib.eachSystem [ "x86_64-linux" "i686-linux" "x86_64-darwin" "aarch64-linux" "armv6l-linux" "armv7l-linux" ] (
      system:
      let
        pkgs = import nixpkgs { inherit system; overlays = [ nixpkgs-lint.overlays.default ]; };
      in
      {
        packages = import ./default.nix { inherit pkgs; };

        devShells.default = with pkgs;
          mkShell {
            buildInputs = [
              nix-update
              nixpkgs-fmt
              nixpkgs-lint
              nurl
              rnix-lsp
              statix
            ];
          };
      }
    );
}
