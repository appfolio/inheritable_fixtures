module InheritableFixtures
  module RailsExtensions
    module Engine
      def self.included(target)
        target.class_eval do
          # I believe in Rails 4.1+ we can do,
          #
          # paths.add('lib/fixtures')
          #
          # and remove EngineConfiguration
          
          initializer :append_fixtures_paths, group: :all do |app|
            app.config.fixtures_paths.unshift(*paths["lib/fixtures"].existent_directories)
          end
        end
      end
    end
  end
end


