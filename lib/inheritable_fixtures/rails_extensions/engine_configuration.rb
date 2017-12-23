module InheritableFixtures
  module RailsExtensions
    module EngineConfiguration
      def paths
        paths = super
        paths.add('lib/fixtures') if paths.add('lib/fixtures').nil?
        paths
      end
    end
  end
end
