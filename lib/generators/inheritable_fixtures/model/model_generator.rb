require 'rails/generators/test_unit/model/model_generator'

##
#  Creates fixtures in a different folder for Rails Engines than for Rails Applications
#  (lib/fixtures and test/fixtures, respectively)

#  TODO :
#     PR to Rails: add fixture_destination_folder option to TestUnit::Generators::ModelGenerator
#     Reason: could delete rendering logic from this class (making it more robust to Rails upgrades)


module InheritableFixtures
  class ModelGenerator < Rails::Generators::NamedBase

    argument :attributes,
      type: :array, default: [], banner: 'field:type field:type'

    class_option :engine_fixture_dir,
      type: :string, default: 'lib/fixtures'

    class_option :app_fixture_dir,
      type: :string, default: 'test/fixtures'

    def self.source_root
      File.expand_path(File.join('test_unit/model/templates'), base_root)
    end

    def create_fixture_file
      if in_an_engine_context?
        render_fixture_template_to options[:engine_fixture_dir]
      else
        render_fixture_template_to options[:app_fixture_dir]
      end
    end

    private

    def in_an_engine_context?
      Rails.application.nil?
    end

    def render_fixture_template_to(fixture_folder)
      template 'fixtures.yml', File.join(fixture_folder, class_path, "#{plural_file_name}.yml")
    end

    def yaml_key_value(key, value)
      if ::TestUnit::Generators::ModelGenerator::RESERVED_YAML_KEYWORDS.include?(key.downcase)
        "'#{key}': #{value}"
      else
        "#{key}: #{value}"
      end
    end

  end
end

