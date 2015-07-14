module InheritableFixtures
  module RailsExtensions
    module Engine
      def self.included(target)
        target.class_eval do
          initializer :append_fixtures_paths, group: :all do |app|
            app.config.fixtures_paths.unshift(*paths["lib/test/fixtures"].existent_directories)
          end
        end
      end
    end
  end
end


