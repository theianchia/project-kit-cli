# frozen_string_literal: true

require_relative "proj_kit/version"
require 'thor'
require "fileutils"

module ProjKit
  class Hanami < Thor::Group
    def start 
      invoke GenerateProject
    end
  end

  class Rails < Thor::Group
    def start 
      invoke GenerateProject
    end
  end

  class Gem < Thor::Group
    def start 
      invoke GenerateProject
    end
  end

  class GenerateProject < Thor::Group
    include Thor::Actions

    def self.source_root
      File.dirname(__FILE__)
    end

    def get_name
      @name = ask("Name of your new project:")
      say "Setting up #{@name}...", :blue
    end

    def create_folder_directory
      FileUtils::mkdir_p "#{@name}/lib/#{@name}"
    end

    def copy_gem_config_files
      Dir.foreach('lib/templates') do |file|
        if file == 'template.gemspec.tt'
          template("templates/#{file}", "#{@name}/#{@name}.gemspec") 
        elsif file == 'main.rb.tt' 
          template("templates/#{file}", "#{@name}/lib/#{@name}.rb")
        elsif file == 'version.rb.tt'
          template("templates/#{file}", "#{@name}/lib/#{@name}/version.rb")
        elsif file == 'README.md.tt'
          template("templates/#{file}", "#{@name}/README.md")
        else 
          template("templates/#{file}", "#{@name}/#{file}")
        end
      end
    end
  end

  class SetUp < Thor
    register(ProjKit::Hanami, "hanami", "hanami", "quick hanami project setup")
    register(ProjKit::Rails, "rails", "rails", "quick rails project setup")
    register(ProjKit::Gem, "gem", "gem", "quick gem setup")
  end
end

