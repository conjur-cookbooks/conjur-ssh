#!/usr/bin/env rake

namespace :cookbooks do
  desc "Update vendor/cookbooks"
  task :vendor do
    puts "Vendoring cookbooks"
    `rm -rf vendor`
    `berks update`
    `berks vendor vendor/cookbooks`
  end

  desc "Package cookbooks into a chef-solo tarball"
  task :package => :vendor do
    version=`git describe --tags --abbrev=0`.strip
    Dir.chdir 'vendor'
    tarball = "conjur-ssh-#{version}.tar.gz"
    puts "Building cookbook tarball #{tarball}"
    `tar czf ../#{tarball} cookbooks`
  end
end
