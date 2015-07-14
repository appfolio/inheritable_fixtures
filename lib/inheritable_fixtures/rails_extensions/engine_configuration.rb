module InheritableFixtures
  module RailsExtensions
    module EngineConfiguration
      def paths
        @paths ||= begin
          paths = super
          paths.add("lib/test/fixtures")
          paths
        end
      end
    end
  end
end


