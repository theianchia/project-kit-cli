# frozen_string_literal: true

require_relative "proj_kit/version"
require 'thor'

module ProjKit
  class SetUp < Thor::Group
    include Thor::Actions
    class_option :verbose, :type => :boolean

    def get_name
      @name = ask("Name of your new project:")
      puts @name
    end

    def create_folder
      Dir.mkdir(@name)
    end

    def copy_licence
      copy_file "templates/LICENSE.txt", "#{@name}/MITLICENSE"
    end

    no_commands do 
      def log(str)
        puts str if options[:verbose]
      end
    end
  end
end