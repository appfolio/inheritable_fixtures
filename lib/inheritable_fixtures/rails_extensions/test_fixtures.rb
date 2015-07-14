module InheritableFixtures
  module RailsExtensions
    module TestFixtures
      
      def included(target)
        super
        target.send(:include, InstanceMethods)
        target.send(:extend, ClassMethods)
        target.class_eval do
          class_attribute :fixture_table_names_per_path, :instance_writer => false
          self.fixture_table_names_per_path = {}
        end
      end
      
      module ClassMethods
        def fixtures(*fixture_set_names)
          original_fixture_path = self.fixture_path

          paths = ([ self.fixture_path ] + Rails.application.config.fixtures_paths)
          paths.each do |path|
            self.fixture_path = path
            self.fixture_table_names = []
            super
            self.fixture_table_names_per_path[path] = self.fixture_table_names
          end

        ensure 
          self.fixture_path = original_fixture_path
        end
      end
      
      module InstanceMethods
        private

        def load_fixtures(*args)
          if defined?(ActiveRecord::FixtureSet) # rails 4.x
            fixtures_class = ActiveRecord::FixtureSet
          end
          raise "do not know how to monkey patch fixtures .. what version of rails are you using?" unless fixtures_class

          fixtures = []
          fixture_table_names_per_path.each do |fixture_path, fixture_table_names|
            fixture_args = [ fixture_path, fixture_table_names, fixture_class_names] + args
            fixtures += fixtures_class.create_fixtures(*fixture_args)
          end
          Hash[fixtures.map { |f| [f.name, f] }]
        end
      end
      
    end
  end
end
