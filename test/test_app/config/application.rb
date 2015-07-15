require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
require 'inheritable_fixtures'

module TestEngine3
  class Engine < Rails::Engine
    config.fixtures_paths.unshift(File.expand_path("../../../fixtures3", __FILE__))
  end
end

module TestEngine2
  class Engine < Rails::Engine
    config.fixtures_paths.unshift(File.expand_path("../../../fixtures2", __FILE__))
  end
end

module TestApp
  class Application < Rails::Application
    # the following need to be set in order to silence warnings
    config.eager_load = true 
    
    if config.active_support.respond_to?(:test_order=)
      config.active_support.test_order = :random
    end

    config.secret_key_base = 'abc'
  end
end
