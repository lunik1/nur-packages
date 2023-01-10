{ lib
, stdenvNoCC
, fetchzip
}:

stdenvNoCC.mkDerivation rec {
  pname = "uosc";
  version = "4.5.0";

  src = fetchzip {
    url = "https://github.com/tomasklaen/uosc/releases/download/${version}/uosc.zip";
    sha256 = "sha256-xLT1YgFxMLYyFCxe4mU8slRlCUGMjnJgk6fBNVXT5Dc=";
    stripRoot = false;
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/mpv/scripts
    cp -r fonts/. $out/share/mpv/fonts
    cp -r scripts/. $out/share/mpv/scripts
  '';

  passthru.scriptName = "uosc.lua";

  meta = with lib; {
    description = "Feature-rich minimalist proximity-based UI for MPV player. ";
    homepage = "https://github.com/tomasklaen/uosc";
    license = licenses.gpl3Only;
    platforms = platforms.all;
    maintainers = with maintainers; [ lunik1 ];
  };
}
