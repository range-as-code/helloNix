{
  description = "A simple hello/cowsay runnable flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.default = pkgs.writeShellApplication {
          name = "greet";
          runtimeInputs = [ pkgs.cowsay ];
          text = ''
            cowsay "Hello from the range! Activated at $(date)"
          '';
        };
      });
}