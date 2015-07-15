require 'rails'
require 'inheritable_fixtures/version'

module InheritableFixtures
  # Your code goes here...
end

require 'inheritable_fixtures/rails_extensions/engine'
require 'inheritable_fixtures/rails_extensions/test_fixtures'
require 'inheritable_fixtures/rails_extensions/test_process'
require 'inheritable_fixtures/engine'

require 'rails/engine'
require 'rails/engine/configuration'
require 'active_record/fixtures'
require 'action_dispatch/testing/test_process'

module ActiveRecord
  module TestFixtures
    class << self
      prepend ::InheritableFixtures::RailsExtensions::TestFixtures
    end
  end
end

module ActionDispatch
  module TestProcess
    prepend ::InheritableFixtures::RailsExtensions::TestProcess
  end
end

Rails::Engine::Configuration.prepend(::InheritableFixtures::RailsExtensions::Engine)

