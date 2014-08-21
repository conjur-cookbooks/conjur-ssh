include_recipe "apt"
include_recipe "conjur-client::default" if node['conjur-ssh'].install_client
include_recipe "conjur-client::ssl_certificate" if node.conjur['ssl_certificate']
include_recipe "terminal-login::install" 
include_recipe "terminal-login::sudoers" if node['conjur-ssh'].install_sudoers
include_recipe "terminal-login::configure" if node['conjur-ssh'].configure
if ('ubuntu' == node['platform'] and Chef::VersionConstraint.new('<= 12.04').include?(node['platform_version'])) 
  include_recipe "terminal-login::logshipper"
end
