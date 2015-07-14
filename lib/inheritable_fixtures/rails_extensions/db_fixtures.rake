Rake::Task['db:fixtures:load'].clear_actions

namespace :db do
  namespace :fixtures do
    # This is heavily based on the original implementation in rails. It handles FIXTURES, FIXTURES_PATH,
    # and FIXTURES_DIR arguments just like the original but it searches for fixtures in all fixtures 
    # paths.
    task :load do 
      require 'active_record/fixtures'
      
      fixtures_paths = if ENV['FIXTURES_PATH']
        [ Rails.root.join(ENV['FIXTURES_PATH'] || %w{test fixtures}).to_s ]
      else
        [ ActiveRecord::Tasks::DatabaseTasks.fixtures_path ] + Rails.application.config.fixtures_paths
      end
      
      fixtures_to_load = ENV['FIXTURES'] ? ENV['FIXTURES'].split(',') : nil
      
      fixtures_paths.each do |base_dir|
        fixtures_dir = File.join [base_dir, ENV['FIXTURES_DIR']].compact
        Dir["#{fixtures_dir}/**/*.yml"].map {|f| f[(fixtures_dir.size + 1)..-5] }.each do |fixture_file|
          if fixtures_to_load
            if fixtures_to_load.include?(fixture_file)
              fixtures_to_load.delete(fixture_file)
            else
              next
            end
          end
          ActiveRecord::FixtureSet.create_fixtures(fixtures_dir, fixture_file)
        end
      end
      
      if fixtures_to_load
        if !fixtures_to_load.empty?
          raise "Fixtures #{fixtures_to_load.inspect} not found in any fixtures path #{fixtures_paths.inspect}"
        end
      end
    end
    
  end
end
