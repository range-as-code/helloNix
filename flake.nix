{
  description = "A minimal flake that runs the Nixpkgs hello package";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

  outputs = { self, nixpkgs }:
    let
      system = builtins.currentSystem;
      pkgs = import nixpkgs { inherit system; };
      helloPkg = pkgs.hello;
    in {
      packages.${system}.default = helloPkg;

      apps.${system}.default = {
        type = "app";
        program = "${helloPkg}/bin/hello";
      };
    };
}
