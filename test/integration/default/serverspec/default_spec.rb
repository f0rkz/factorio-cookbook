orequire 'spec_helper'

describe 'factrio::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html

  describe file('/usr/src/factorio.tar.gz') do
    it { should exist }
  end

  describe file('/srv') do
    it { should exist }
  end

  describe file('/srv/factorio/bin/x64/factorio') do
    it { should exist }
  end

  describe service('factorio') do
    its(:user) { should eq 'root' }
    it { should be_enabled }
    it { should be_running }
  end

  describe port(34_197) do
    it { should be_listening }
  end
end
