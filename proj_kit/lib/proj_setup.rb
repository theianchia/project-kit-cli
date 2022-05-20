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
  class Hanami < SubCommandBase
    desc "new", "create new Hanami project"
    def new 
      invoke GenerateProject
    end
  end 

  class Rails < SubCommandBase
    desc "new", "create new Rails project"
    def new 
      invoke GenerateProject
    end
  end

  class Gem < SubCommandBase
    desc "new", "create new Gem"
    def new  
      invoke GenerateProject
    end
  end

  class Generate < SubCommandBase
    include Thor::Actions
    
    
    desc "all", "generate all project files"
    # method_option :license, :type => :boolean, :aliases => "-l", :desc => "include license file"
    def generate
      invoke GenerateProject
      # invoke :self.source_root
      # invoke :get_name
      # invoke :create_folder
      # invoke :copy_gem_config_files
      # invoke :copy_license if options[:license]
      # invoke :create_lib_and_namespace_folder
      # invoke :copy_main_files
    end

    # desc "source_root", "set source root"
    # def self.source_root
    #   File.dirname(__FILE__)
    # end

    # desc "get_name", "get name of project"
    # def get_name
    #   @name = ask("Name of your new project:")
    #   say "Setting up #{@name}...", :blue
    # end

    # desc "create_folder", "create project folder"
    # def create_folder
    #   Dir.mkdir(@name)
    # end

    # desc "copy_gem_config_files", "copy gem config files"
    # def copy_gem_config_files
    #   template("templates/template.gemspec.tt", "#{@name}/#{@name}.gemspec")
    #   template("templates/Gemfile", "#{@name}/Gemfile")
    #   template("templates/README.md.tt", "#{@name}/README.md")
    #   template("templates/.gitignore", "#{@name}/.gitignore")
    # end

    # desc "copy_license", "copy license"
    # def copy_license
    #   copy_file "templates/LICENSE.txt", "#{@name}/MITLICENSE"
    # end

    # desc "create_lib_and_namespace_folder", "create lib and namespace folder"
    # def create_lib_and_namespace_folder
    #   Dir.mkdir("#{@name}/lib")
    #   Dir.mkdir("#{@name}/lib/#{@name}")
    # end

    # desc "copy_main_files", "copy main files"
    # def copy_main_files
    #   template("templates/main.rb.tt", "#{@name}/lib/#{@name}.rb")
    #   template("templates/version.rb.tt", "#{@name}/lib/#{@name}/version.rb")
    # end
    
  end

  class SetUp < Thor
    register(ProjKit::Hanami, "hanami", "hanami", "quick hanami project setup")
    register(ProjKit::Rails, "rails", "rails", "quick rails project setup")
    # desc "hanami", "create files for a hanami app"
    # subcommand "hanami", Hanami

    # desc "rails", "create files for a rails app"
    # subcommand "rails", Rails

    # desc "gem", "create files for a gem"
    # subcommand "gem", Gem
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

    def create_folder
      Dir.mkdir(@name)
    end

    def copy_gem_config_files
      template("templates/template.gemspec.tt", "#{@name}/#{@name}.gemspec")
      template("templates/Gemfile", "#{@name}/Gemfile")
      template("templates/README.md.tt", "#{@name}/README.md")
      template("templates/.gitignore", "#{@name}/.gitignore")
    end

    def copy_license
      copy_file "templates/LICENSE.txt", "#{@name}/MITLICENSE"
    end

    def create_lib_and_namespace_folder
      Dir.mkdir("#{@name}/lib")
      Dir.mkdir("#{@name}/lib/#{@name}")
    end

    def copy_main_files
      template("templates/main.rb.tt", "#{@name}/lib/#{@name}.rb")
      template("templates/version.rb.tt", "#{@name}/lib/#{@name}/version.rb")
    end
  end

end

