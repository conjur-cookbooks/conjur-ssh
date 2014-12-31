require 'spec_helper'

describe "conjur-ssh::default" do
  let(:chef_run) {
    ChefSpec::Runner.new(platform: platform, version: version) do |runner|
      runner.default.conjur = {
        host_identity: {
          id: 'the-host-id',
          api_key: 'the-host-api-key'
        }
      }
    end
  }
  let(:subject) {
    chef_run.converge(described_recipe)
  }
  let(:platform) { 'ubuntu' }
  let(:version) { '12.04' }
  before {
    chef_run.node.automatic.platform_family = 'debian'
    File.stub(:read).and_call_original
    File.stub(:read).with('/etc/ssh/sshd_config').and_return ""
    File.stub(:read).with("/etc/conjur.conf").and_return <<-CONF
account: test
appliance_url: https://conjur.example.com/api
CONF
  }
  context "full install" do
    it "executes successfully" do
      subject.should include_recipe("apt")
      subject.should include_recipe("conjur-client::default")
      subject.should_not include_recipe("conjur-client::ssl_certificate")
      subject.should include_recipe("terminal-login::install")
      subject.should include_recipe("terminal-login::sudoers")
      subject.should include_recipe("terminal-login::configure")
    end
  end
end
