# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'

require 'bundler'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  warn e.message
  warn 'Run `bundle install` to install missing gems'
  exit e.status_code
end

if ENV['WITH_COVERAGE'] == 'true'
  require 'simplecov'
  SimpleCov.start do
    enable_coverage :branch
    add_filter(/\A\/test/)
  end
end

require 'logger' # Due to issue with activesupport / concurrent-ruby

require File.expand_path('../test_app/config/environment', __FILE__)

# Re-create test database
ActiveRecord::Tasks::DatabaseTasks.drop_current
ActiveRecord::Tasks::DatabaseTasks.create_current

require_relative './test_app/db/schema'

Schema.up

require 'debug'
require 'minitest/autorun'
require 'minitest/reporters'
require 'rails/test_help'

Minitest::Test.make_my_diffs_pretty!
Minitest::Reporters.use! unless ENV['RM_INFO']
