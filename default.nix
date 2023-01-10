{ pkgs ? import <nixpkgs> { } }:

{
  lib = import ./lib { inherit pkgs; };
  modules = import ./modules;
  overlays = import ./overlays;

  amazing-marvin = pkgs.callPackage ./pkgs/amazing-marvin { };
  mpvScripts = {
    thumbfast = pkgs.callPackage ./pkgs/mpv-scripts/thumbfast { };
    uosc = pkgs.callPackage ./pkgs/mpv-scripts/uosc { };
  };
}
