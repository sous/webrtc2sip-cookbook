#
# Cookbook Name:: webrtc2sip
# Recipe:: default
#
# Copyright (C) 2013 Sous
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'git'

directory "/opt/debs"

git '/opt/debs/webrtc2sip-precise' do
  repository "https://github.com/sous/webrtc2sip-precise.git"
  reference 'master'
  action :sync
end

execute 'apt-key add /opt/debs/webrtc2sip-precise/apt-key.gpg' do
  command 'cat /opt/debs/webrtc2sip-precise/apt-key.gpg | apt-key add -'
end

include_recipe 'apt'

apt_repository 'webrtc2sip-precise' do
  uri 'file:///opt/debs/webrtc2sip-precise'
  distribution node['lsb']['codename']
  components ["main"]
  action :add
end

