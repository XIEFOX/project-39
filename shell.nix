{pkgs}:
pkgs.mkShell {
  packages = with pkgs; [
    libiconv

    fd
    gnumake

    alejandra
    clang-tools
    yamlfmt
    taplo
    deno

    protobuf
    buf
    protoc-gen-dart
  ];
}
