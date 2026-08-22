{ pkgs, ... }:
{
  virtualisation.lxc = {
    enable = true;
    lxcfs.enable = true;
  };
  virtualisation.docker.enable = true;
  #virtualisation.waydroid.enable = true;
  #virtualisation.waydroid.package = pkgs.waydroid-nftables;
  #networking.firewall.trustedInterfaces = [ "waydroid0" ];

  networking.bridges.lxcbr0.interfaces = [];
  networking.interfaces.lxcbr0 = {
    ipv4.addresses = [{
      address = "10.0.3.1";
      prefixLength = 24;
    }];
    ipv6.addresses = [{
      address = "fd42:4242:4242:1::1";
      prefixLength = 64;
    }];
  };

  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = 1;
    "net.ipv6.conf.all.forwarding" = 1;
    "net.ipv6.conf.default.forwarding" = 1;
  };

  networking.nftables.enable = true;
  networking.nftables.ruleset = ''
    table inet nat {
      chain postrouting {
        type nat hook postrouting priority srcnat; policy accept;
        # NAT66 для выхода контейнеров во внешний IPv6-интернет
        ip6 saddr fd42:4242:4242:1::/64 oifname "eth0" masquerade
      }
    }
  '';
}
