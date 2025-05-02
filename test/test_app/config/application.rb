require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

require 'inheritable_fixtures'

require_relative '../../test_engine3/lib/test_engine3'
require_relative '../../test_engine2/lib/test_engine2'

module TestApp
  class Application < Rails::Application
    config.load_defaults "#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}"
    config.eager_load = true 
    config.secret_key_base = 'abc'
  end
end
