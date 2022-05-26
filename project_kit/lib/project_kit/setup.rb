# frozen_string_literal: true

require "thor"
require "pathname"
TEMPLATE_PATH = File.expand_path("../templates", File.dirname(__FILE__))

module ProjectKit
  class SetUpFiles < Thor::Group
    include Thor::Actions
    class_option :type

    def self.source_root
      File.dirname(__FILE__)
    end

    def create_files
      type = options[:type]
      return say "could not find #{type} template directory", :red unless Dir.exist?("#{TEMPLATE_PATH}/#{type}")
      @name = ask("Name of your new project:")
      say "Setting up #{@name}...", :blue
      Dir.glob("#{TEMPLATE_PATH}/#{type}/**/*", File::FNM_DOTMATCH) do |abs_file|
        file_pathname = Pathname.new(abs_file)
        template_pathname = Pathname.new("#{TEMPLATE_PATH}/#{type}")
        file = file_pathname.relative_path_from(template_pathname).to_s
        unless (['.', '..'].include?(file) or file.include?('.DS_Store'))
          if File.file?(abs_file)
            template("../templates/#{type}/#{file}", "../#{@name}/#{file}")
          end 
        end
      end
      say "#{@name} #{type} project successfully setup", :green
    end 
  end 

  class SetUp < Thor
    def self.exit_on_failure?
      true
    end

    desc 'hanami', 'initial hanami app setup'
    def hanami
      invoke SetUpFiles, [], type: "hanami" 
    end

    desc 'rails', 'initial rails app setup'
    def rails
      invoke SetUpFiles, [], type: "rails" 
    end

    desc 'gem', 'initial gem setup'
    def gem
      invoke SetUpFiles, [], type: "gem" 
    end
  end
end

