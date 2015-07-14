module InheritableFixtures
  class Engine < Rails::Engine
    config.fixtures_paths = []
    
    rake_tasks do
      load File.expand_path("../rails_extensions/db_fixtures.rake", __FILE__)
    end
  end
end