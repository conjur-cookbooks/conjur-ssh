require 'chefspec'
require 'chefspec/berkshelf'

RSpec.configure do |config|
  config.cookbook_path = [
    File.expand_path('../..', File.dirname(__FILE__)),
    File.expand_path('../vendor/cookbooks', File.dirname(__FILE__))
  ]
end
