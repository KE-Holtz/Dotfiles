{ stdenv
, lib
, fetchurl
, autoPatchelfHook
, alsa-lib
, fontconfig
, freetype
, zlib
, libGL
, xorg
, gtk3
, pango
, cairo
, atk
, glib
, ffmpeg # Optional: Provides runtime FFmpeg for media support
}:

stdenv.mkDerivation rec {
  pname = "liberica-jdk-full";
  version = "21.0.4"; # Match your downloaded version

  src = fetchurl {
   url = "https://download.bell-sw.com/java/25.0.4.1+1/bellsoft-jdk25.0.4.1+1-linux-amd64-full.tar.gz";
   sha256 = "1l6bfgqpx77g8nji9ahxs2d1chfhk8j9falr97fmi3gs7j36kpkl"; # Replace this after running nix-prefetch-url
  };
  nativeBuildInputs = [ autoPatchelfHook ];

  # Prevents auto-patchelf from failing on legacy/unused dynamic FFmpeg plugins
  autoPatchelfIgnoreMissingDeps = true;

  buildInputs = [
    alsa-lib
    fontconfig
    freetype
    zlib
    libGL
    ffmpeg
    stdenv.cc.cc.lib
    xorg.libX11
    xorg.libXext
    xorg.libXi
    xorg.libXrender
    xorg.libXtst
    xorg.libXcomposite
    xorg.libXcursor
    xorg.libXdamage
    xorg.libXrandr
    xorg.libXScrnSaver
    xorg.libXt
    xorg.libXxf86vm # Required by libprism_es2.so
    gtk3
    pango
    cairo
    atk
    glib
  ];

  installPhase = ''
    mkdir -p $out
    cp -r * $out/
  '';

  meta = with lib; {
    description = "BellSoft Liberica JDK (Full Version with JavaFX)";
    homepage = "https://bell-sw.com/liberica-jdk/";
    platforms = [ "x86_64-linux" ];
    license = licenses.gpl2Only;
  };
}
