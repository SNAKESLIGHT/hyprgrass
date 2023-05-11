{
  lib,
  stdenv,
  ninja,
  meson,
  hyprland,
  pkg-config,
  cairo,
  hyprland-protocols,
  libdrm,
  libinput,
  libxkbcommon,
  mesa,
  pango,
  udis86,
  wayland,
  wayland-protocols,
  wayland-scanner,
  pciutils,
  wlroots,
  libxcb,
  xcbutilwm,
  xwayland,
  wf-touch,
  version ? "git",
}:
stdenv.mkDerivation {
  pname = "hyprland-touch-gestures";
  inherit version;
  src = ./..;

  outputs = ["out"];

  patches = [
    ./meson-build.patch
  ];

  nativeBuildInputs = [pkg-config ninja meson];

  buildInputs = [
    hyprland
    cairo
    hyprland-protocols
    libdrm
    libinput
    libxkbcommon
    mesa
    pango
    udis86
    wayland
    wayland-protocols
    wayland-scanner
    pciutils
    wlroots
    wf-touch

    libxcb
    xcbutilwm
    xwayland
  ];

  meta = with lib; {
    homepage = "https://github.com/horriblename/hyprland-touch-gestures";
    description = "Hyprland plugin for touch gestures";
    # TODO license
    platforms = platforms.linux;
  };
}
