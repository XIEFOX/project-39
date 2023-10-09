let
  pkgs = import <nixpkgs> {};
in
  pkgs.mkShell {
    packages = with pkgs; [
      fd
      gnumake

      alejandra
      clang-tools
      yamlfmt
      taplo
      deno

      protobuf
      buf
    ];
  }
