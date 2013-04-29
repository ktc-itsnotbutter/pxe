# default thing to install
#  should be a better wway
default[:pxe][:default] = "ubuntu-precise"
default[:syslinux][:dir] = "/usr/share/syslinux/"

default[:pxe][:hosts_bag] = "dhcp_hosts"
default[:pxe][:groups_bag] = "dhcp_groups"
default[:pxe][:networks_bag] = "dhcp_networks"

case node[:platform_family]
when "rhel"
  default[:pxe][:packages] = ["system-config-netboot-cmd", "syslinux"]
  default[:syslinux][:dir] = "/usr/share/syslinux/"
when "debian"
  default[:pxe][:packages] = ["syslinux-common"]
  default[:syslinux][:dir] = "/usr/lib/syslinux/"
end


