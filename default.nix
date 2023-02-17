{ pkgs ? import <nixpkgs> { } }:

{
  lib = import ./lib { inherit pkgs; };
  modules = import ./modules;
  overlays = import ./overlays;

  amazing-marvin = pkgs.callPackage ./pkgs/amazing-marvin { };
  fsrcnnx-x2-8-0-4-1 = pkgs.callPackage ./pkgs/mpv-shaders/fsrcnnx { variant = "8-0-4-1"; };
  fsrcnnx-x2-16-0-4-1 = pkgs.callPackage ./pkgs/mpv-shaders/fsrcnnx { variant = "16-0-4-1"; };
  quality-menu = pkgs.callPackage ./pkgs/mpv-scripts/quality-menu { };
  xcompose = pkgs.callPackage ./pkgs/xcompose { };
}
