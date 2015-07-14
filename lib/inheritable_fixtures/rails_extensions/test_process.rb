module InheritableFixtures
  module RailsExtensions
    module TestProcess
      def fixture_file_upload(path, mime_type = nil, binary = false)
        fixtures_paths = Rails.application.config.fixtures_paths
        if self.class.respond_to?(:fixture_path) && self.class.fixture_path
          fixtures_paths.unshift(fixture_path)
        end
      
        fixtures_paths.each do |fixtures_path|
          fixtures_path = File.join(fixtures_path, path)
          if File.exist?(fixtures_path)
            return Rack::Test::UploadedFile.new(fixtures_path, mime_type, binary)
          end
        end 
      
        raise "#{path} not found in #{fixtures_paths}"
      end
    end
  end
end