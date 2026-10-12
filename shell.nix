{ pkgs ? import <nixpkgs> {} }:
(pkgs.buildFHSEnv {
  name = "buildroot-env";
  targetPkgs = pkgs: with pkgs; [
    glibc glibc.dev glibc.static
    which perl cpio unzip rsync file bc pkg-config
    ncurses ncurses.dev
    libiconv
    zlib zlib.dev
    gcc gnumake binutils patch gzip bzip2 gnutar
    diffutils findutils gawk gnused
    wget curl git python3
  ];
}).env
