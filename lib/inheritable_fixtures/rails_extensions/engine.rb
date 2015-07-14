module InheritableFixtures
  module RailsExtensions
    module Engine
      def self.included(target)
        target.class_eval do
          initializer :append_fixtures_paths, group: :all do |app|
            engine_name = self.class.name.split('::')[-2].underscore
            fixtures_path = root.join('lib', engine_name, 'test', 'fixtures').to_s
            app.config.fixtures_paths.unshift(fixtures_path) if File.exists?(fixtures_path)
          end
        end
      end
    end
  end
end


