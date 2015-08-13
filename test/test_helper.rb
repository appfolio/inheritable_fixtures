require 'minitest_helper'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../test_app/config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # include InheritableFixtures::ActiveRecordExtensions::Fixtures
end
