{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  name = "pro3";
  packages = with pkgs; [
    emacs29
    git
    coreutils
    fontconfig
    findutils
    emacsPackages.use-package
  ];
  shellHook = ''
    export LANG=en_US.UTF-8
  '';
}
