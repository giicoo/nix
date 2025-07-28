{pkgs, ...}: {
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    zlib
    glib
    openssl
    libuuid
    icu
    libunwind
    libxcrypt-legacy
    # Add more if needed depending on the binary
  ];
}
