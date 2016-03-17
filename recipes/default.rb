#
# Cookbook Name:: factorio
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

if 'debian' == node['platform_family']
  include_recipe "apt"
end

package 'daemon'

directory '/srv' do
  mode '0755'
  recursive true
end

directory '/srv/save' do
  mode '0755'
  recursive true
end

directory '/var/log/factorio' do
  mode '0755'
  recursive true
end

remote_file '/usr/src/factorio.tar.gz' do
  source "http://www.factorio.com/get-download/#{node['factorio']['version']}/headless/linux64"
  mode '0755'
end

bash 'unzip factorio' do
  user 'root'
  cwd '/usr/src/'
  creates 'maybe'
  code <<-EOH
    STATUS=0
    tar xzf factorio.tar.gz || STATUS=1
    mv factorio/ /srv/ || STATUS=1
    exit $STATUS
  EOH
end

bash 'create the inital map' do
  user 'root'
  cwd '/srv/factorio/'
  creates '/srv/save/map'
  code <<-EOH
    STATUS=0
    ./bin/x64/factorio --create /srv/save/map || STATUS=1
    exit $STATUS
  EOH
end

template '/etc/init.d/factorio' do
  source 'factorio.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

service 'factorio' do
  supports restart: true, start: true, stop: true, reload: true
  action [:enable, :start]
end
