# frozen_string_literal: true

require_relative "proj_kit/version"
require 'thor'

module ProjKit
  class SetUp < Thor::Group
    include Thor::Actions
    class_option :license, :type => :boolean

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
      return unless options[:license]
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