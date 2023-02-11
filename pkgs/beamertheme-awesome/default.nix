{ lib, stdenvNoCC, fetchFromGitHub, texlive, lmodern }:

stdenvNoCC.mkDerivation {
  pname = "beamertheme-awesome";
  version = "unstable-2023-02-02";
  passthru.tlType = "run";

  src = fetchFromGitHub {
    repo = "awesome-beamer";
    owner = "LukasPietzschmann";
    rev = "98789598c4522a7d18975db49b7b4094f8d1c5b5";
    sha256 = "sha256-7ffhL4P36reYHoVOiu3aLbAoJLJiZoia0aQD9jym/+c=";
  };

  nativeBuildInputs = [ texlive.combined.scheme-small ];

  dontConfigure = true;

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    path="$out/tex/latex/beamertheme-awesome"
    mkdir -p "$path"
    cp beamerthemeawesome.sty "$path/"

    runHook postInstall
  '';

  meta = with lib; {
    description = "Kinda awesome beamer theme.";
    license = licenses.bsd3;
    maintainers = with maintainers; [ lunik1 ];
    platforms = platforms.all;
  };
}
