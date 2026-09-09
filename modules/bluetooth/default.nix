{ ... }:
{
  services.blueman.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      Input = {
        ClassicBoundedOnly = false;
        UserspaceHID = false;
      };
    };
  };
}
