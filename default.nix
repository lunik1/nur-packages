{ pkgs ? import <nixpkgs> { } }:

{
  lib = import ./lib { inherit pkgs; };
  modules = import ./modules;
  overlays = import ./overlays;

  amazing-marvin = pkgs.callPackage ./pkgs/amazing-marvin { };
  beamertheme-awesome = pkgs.callPackage ./pkgs/beamertheme-awesome { };
  xcompose = pkgs.callPackage ./pkgs/xcompose { };
  quality-menu = pkgs.callPackage ./pkgs/mpv-scripts/quality-menu { };
}
