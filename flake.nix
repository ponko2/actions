{
  description = "actions";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];
      perSystem =
        { pkgs, ... }:
        {
          apps = {
            commitlint = {
              type = "app";
              program = "${pkgs.commitlint}/bin/commitlint";
            };
            oxfmt = {
              type = "app";
              program = "${pkgs.oxfmt}/bin/oxfmt";
            };
          };
          devShells.default = pkgs.mkShellNoCC {
            packages = with pkgs; [
              commitlint
              editorconfig-checker
              lefthook
              nixfmt-rfc-style
              oxfmt
              yamllint
            ];
            shellHook = ''
              lefthook install
            '';
          };
          formatter = pkgs.nixfmt-tree;
          packages = {
            inherit (pkgs)
              direnv
              nix-direnv
              ;
          };
        };
    };
}
