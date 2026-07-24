{ self, inputs, ... }: {
  flake.nixosModules.ctf = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
          # Web & Network
          burpsuite
          nmap
          wireshark
          ffuf
          sqlmap
          nikto
          curl
          wget
    ];

  };
}
