#
# Author:: Jesse Nelson <spheromak@gmail.com>
# Cookbook Name:: pxe
# Recipe:: redhat
#

class Chef::Recipe
  include Helpers::Repos
end


repo_server = find_repo_servers.first

include_recipe "tftp::server"
include_recipe "pxe::default"
include_recipe "pxe::centos6"

pxe_menu "cent-rescue" do
  section "centos"
  label "Centos Rescue Mode"
  kernel "centos/6/vmlinuz"
  initrd "centos/6/initrd.img"
  append "ramdisk_size=16000 text rescue ks=http://#{ repo_server }/prod/ks/rescue.ks"
end

  


