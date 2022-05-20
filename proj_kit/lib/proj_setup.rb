# frozen_string_literal: true

require_relative "proj_kit/version"
require 'thor'

class SubCommandBase < Thor
  def self.banner(command, namespace = nil, subcommand = false)
    "#{basename} #{subcommand_prefix} #{command.usage}"
  end

  def self.subcommand_prefix
    self.name.gsub(%r{.*::}, '').gsub(%r{^[A-Z]}) { |match| match[0].downcase }.gsub(%r{[A-Z]}) { |match| "-#{match[0].downcase}" }
  end
end

module ProjKit
  class Hanami < Thor::Group
    include Thor::Actions

    def self.source_root
      File.dirname(__FILE__)
    end

    def get_name
      @name = ask("Name of your new project:")
      say "Setting up #{@name}...", :blue
    end

    def create_folder
      Dir.mkdir(@name)
    end

    def create_lib_and_namespace_folder
      Dir.mkdir("#{@name}/lib")
      Dir.mkdir("#{@name}/lib/#{@name}")
    end

    def copy_gem_config_files
      Dir.foreach('lib/templates') do |file|
        if file == 'template.gemspec.tt'
          template("templates/#{file}", "#{@name}/#{@name}.gemspec") 
        elsif file == 'main.rb.tt' 
          template("templates/#{file}", "#{@name}/lib/#{file}")
        elsif file == 'version.rb.tt'
          template("templates/#{file}", "#{@name}/lib/#{@name}/#{file}")
        else 
          template("templates/#{file}", "#{@name}/#{file}")
        end
      end
    end
  end 

  class Rails < SubCommandBase
    include Thor::Actions

    def self.source_root
      File.dirname(__FILE__)
    end

    def get_name
      @name = ask("Name of your new project:")
      say "Setting up #{@name}...", :blue
    end

    def create_folder
      Dir.mkdir(@name)
    end

    def create_lib_and_namespace_folder
      Dir.mkdir("#{@name}/lib")
      Dir.mkdir("#{@name}/lib/#{@name}")
    end

    def copy_gem_config_files
      Dir.foreach('lib/templates') do |file|
        if file == 'template.gemspec.tt'
          template("templates/#{file}", "#{@name}/#{@name}.gemspec") 
        elsif file == 'main.rb.tt' 
          template("templates/#{file}", "#{@name}/lib/#{file}")
        elsif file == 'version.rb.tt'
          template("templates/#{file}", "#{@name}/lib/#{@name}/#{file}")
        else 
          template("templates/#{file}", "#{@name}/#{file}")
        end
      end
    end
  end

  class Gem < SubCommandBase
    include Thor::Actions

    def self.source_root
      File.dirname(__FILE__)
    end

    def get_name
      @name = ask("Name of your new project:")
      say "Setting up #{@name}...", :blue
    end

    def create_folder
      Dir.mkdir(@name)
    end

    def create_lib_and_namespace_folder
      Dir.mkdir("#{@name}/lib")
      Dir.mkdir("#{@name}/lib/#{@name}")
    end

    def copy_gem_config_files
      Dir.foreach('lib/templates') do |file|
        if file == 'template.gemspec.tt'
          template("templates/#{file}", "#{@name}/#{@name}.gemspec") 
        elsif file == 'main.rb.tt' 
          template("templates/#{file}", "#{@name}/lib/#{file}")
        elsif file == 'version.rb.tt'
          template("templates/#{file}", "#{@name}/lib/#{@name}/#{file}")
        else 
          template("templates/#{file}", "#{@name}/#{file}")
        end
      end
    end
  end

  class Generate < SubCommandBase
    
    desc "all", "generate all project files"
    def generate
      invoke GenerateProject
    end
    
  end

  class SetUp < Thor
    register(ProjKit::Hanami, "hanami", "hanami", "quick hanami project setup")
    register(ProjKit::Rails, "rails", "rails", "quick rails project setup")
    register(ProjKit::Gem, "gem", "gem", "quick gem setup")

    # desc "hanami", "create files for a hanami app"
    # subcommand "hanami", Hanami

    # desc "rails", "create files for a rails app"
    # subcommand "rails", Rails

    # desc "gem", "create files for a gem"
    # subcommand "gem", Gem
  end

  # class GenerateProject < Thor::Group
  #   include Thor::Actions

  #   def self.source_root
  #     File.dirname(__FILE__)
  #   end

  #   def get_name
  #     @name = ask("Name of your new project:")
  #     say "Setting up #{@name}...", :blue
  #   end

  #   def create_folder
  #     Dir.mkdir(@name)
  #   end

  #   def copy_gem_config_files
  #     template("templates/template.gemspec.tt", "#{@name}/#{@name}.gemspec")
  #     template("templates/Gemfile", "#{@name}/Gemfile")
  #     template("templates/README.md.tt", "#{@name}/README.md")
  #     template("templates/.gitignore", "#{@name}/.gitignore")
  #   end

  #   def copy_license
  #     copy_file "templates/LICENSE.txt", "#{@name}/MITLICENSE"
  #   end

  #   def create_lib_and_namespace_folder
  #     Dir.mkdir("#{@name}/lib")
  #     Dir.mkdir("#{@name}/lib/#{@name}")
  #   end

  #   def copy_main_files
  #     template("templates/main.rb.tt", "#{@name}/lib/#{@name}.rb")
  #     template("templates/version.rb.tt", "#{@name}/lib/#{@name}/version.rb")
  #   end
  # end

end

