module InheritableFixtures
  module RailsExtensions
    module Engine
      def self.included(target)
        target.class_eval do
          initializer :append_fixtures_paths, group: :all do |app|
            fixtures_path = root.join('lib', name.underscore, 'test', 'fixtures').to_s
            app.config.fixtures_paths.unshift(fixtures_path) if File.exists?(fixtures_path)
          end
        end
      end
    end
  end
end


