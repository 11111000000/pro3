{
  description = "pro3 development shell (flakes)";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f (import nixpkgs { inherit system; }));
    in
    {
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          name = "pro3";
          packages = with pkgs; [
            emacs29
            git
            coreutils
            findutils
            fontconfig
            emacsPackages.use-package
          ];
          shellHook = ''
            export LANG=en_US.UTF-8
          '';
        };
      });
    };
}
