# Inspired by: https://github.com/rails/rails/blob/v4.0.12/railties/test/generators/generators_test_helper.rb

require 'test_helper'
require 'rails/generators'
require 'rails/generators/test_case'

# Call configure to load the settings from
# Rails.application.config.generators to Rails::Generators
Rails.application.load_generators

module GeneratorsTestHelper
  def self.included(base)
    base.class_eval do
      destination File.join(Rails.root, "tmp")
      setup :prepare_destination
      teardown :remove_destination

      define_method :remove_destination do
        rm_rf(destination_root)
      end
    end
  end
end
