#
# Cookbook Name:: minecraft-basic
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'factorio::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end

    it 'creates a directory /srv' do
      expect(chef_run).to create_directory('/srv')
    end

    it 'creates a directory /srv/save' do
      expect(chef_run).to create_directory('/srv/save')
    end

    it 'creates a directory /var/log/factorio' do
      expect(chef_run).to create_directory('/var/log/factorio')
    end

    describe 'factorio installation' do
      it 'is retrieved and placed in src directory' do
        expect(chef_run).to create_remote_file('/usr/src/factorio.tar.gz')
      end
    end

    it 'runs a bash script extract the tarball' do
      expect(chef_run).to run_bash('unzip factorio')
    end

    it 'runs a bash script create the inital map' do
      expect(chef_run).to run_bash('create the inital map')
    end

    it 'creates a template to run the service' do
      expect(chef_run).to create_template('/etc/init.d/factorio')
    end
  end
end
