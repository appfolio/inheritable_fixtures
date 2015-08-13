require 'rails/generators/test_unit'

module TestUnit # :nodoc:
  module Generators # :nodoc:
    class ModelGenerator < Base # :nodoc:

      def self.source_root
        File.expand_path(File.join('test_unit/model/templates'), base_root)
      end

      RESERVED_YAML_KEYWORDS = %w(y yes n no true false on off null)

      argument :attributes, type: :array, default: [], banner: "field:type field:type"
      class_option :fixture, type: :boolean

      check_class_collision suffix: "Test"

      def create_test_file
        template 'unit_test.rb', File.join('test/models', class_path, "#{file_name}_test.rb")
      end

      hook_for :fixture_replacement

      def create_fixture_file
        target_dir = in_an_engine_context? ? 'lib/fixtures' : 'test/fixtures'

        if options[:fixture] && options[:fixture_replacement].nil?
          template 'fixtures.yml', File.join(target_dir, class_path, "#{plural_file_name}.yml")
        end
      end

      private

      def yaml_key_value(key, value)
        if RESERVED_YAML_KEYWORDS.include?(key.downcase)
          "'#{key}': #{value}"
        else
          "#{key}: #{value}"
        end
      end

      def in_an_engine_context?
        Rails.application.nil?
      end
    end
  end
end
