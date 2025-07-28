{
  virtualisation.docker = {
    enable = true;
    
    rootless = {
        enable = true;
        setSocketVariable = true;
    };
    # Set up resource limits
    daemon.settings = {
        experimental = true;
        default-address-pools = [
        {
            base = "172.30.0.0/16";
            size = 24;
        }
        ];
    };
  };

}