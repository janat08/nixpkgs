{ stdenv, fetchurl, pkgconfig, intltool, itstool, libxml2, libcanberra-gtk3, libgtop, libstartup_notification, gnome3, gtk3, wrapGAppsHook }:

stdenv.mkDerivation rec {
  name = "marco-${version}";
  version = "1.22.0";

  src = fetchurl {
    url = "http://pub.mate-desktop.org/releases/${stdenv.lib.versions.majorMinor version}/${name}.tar.xz";
    sha256 = "1i1pi1z9mrb6564mxcwb93jqpdppfv58c2viwmicsixis62hv5wx";
  };

  nativeBuildInputs = [
    pkgconfig
    intltool
    itstool
    wrapGAppsHook
  ];

  buildInputs = [
    libxml2
    libcanberra-gtk3
    libgtop
    libstartup_notification
    gtk3
    gnome3.zenity
  ];

  meta = with stdenv.lib; {
    description = "MATE default window manager";
    homepage = https://github.com/mate-desktop/marco;
    license = [ licenses.gpl2 ];
    platforms = platforms.unix;
    maintainers = [ maintainers.romildo ];
  };
}
