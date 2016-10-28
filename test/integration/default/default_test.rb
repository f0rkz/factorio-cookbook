# # encoding: utf-8

# Inspec test for recipe ac_chef_server::default

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html

# Validate Factorio is installed and running
describe file('/usr/src/factorio.tar.gz') do
  it { should exist }
end

describe directory('/srv') do
  it { should exist }
end

describe file('/srv/factorio/bin/x64/factorio') do
  it { should exist }
end

describe directory('/var/log/factorio/') do
  it { should exist }
end

describe file('/var/log/factorio/factorio.log') do
  it { should exist }
end

describe service('factorio') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe port(34_197) do
  it { should be_listening }
  its('protocols') { should include 'udp' }
end
