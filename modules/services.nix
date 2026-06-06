{ config, ... }:
{
	services.zfs.autoScrub.enable = true;
	services.zfs.autoSnapshot.enable = true;
}
