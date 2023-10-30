{pkgs}:
pkgs.mkShell {
  packages = with pkgs; [
    libiconv
    darwin.apple_sdk.frameworks.Security

    fd
    gnumake

    alejandra
    clang-tools
    yamlfmt
    taplo
    deno
    sqlfluff

    protobuf
    buf
    protoc-gen-dart
  ];
}
