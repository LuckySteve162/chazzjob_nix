{ config, ... }

{
  virtualisation.libvird = {
    enable = true;
    onBoot = "start";
    onShutdown = "shutdown";
    qemu = {
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
	packages = [(pkgs.ovmf.override {
	  secureBoot = true;
	  tpmSupport = true;
	}).fd];
      };
    };
  };

}
