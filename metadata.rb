name              'conjur-ssh'
maintainer        'Conjur, Inc.'
maintainer_email  'kgilpin@conjur.net'
license           'Apache 2.0'
description       'Installs Conjur SSH'
version           '0.1.0'

attribute 'conjur-ssh/install_client',
  description: "Whether to install the Conjur CLI",
  default: "true"

attribute 'conjur-ssh/install_sudoers',
  description: "Whether to create /etc/sudoers.d that allows passwordless sudo for admin-level users",
  default: "true"

attribute 'conjur-ssh/configure',
  description: "Whether to configure the PAM+LDAP system",
  default: "true"

depends "apt"
depends "conjur-client"
depends "terminal-login"

%w(ubuntu centos fedora).each do |platform|
  supports platform
end
