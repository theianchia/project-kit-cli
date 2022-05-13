# frozen_string_literal: true

require_relative "proj_kit/version"
require 'thor'

module ProjKit
  class CLI < Thor
    class_option :verbose, :type => :boolean
  
    desc 'output FILE', 'prints the content of FILE'
    option :stderr, :type => :boolean, :desc => 'prints the content of FILE to STDERR handle'
    option :new_file, :desc => 'writes the content to NEW_FILE'
    def output(file_name)
      new_file = options[:new_file]
      log("Starting to read file...")
      contents = File.read(file_name)
      log("File contents:")
      if options[:stderr]
        log("(in stderr)")
        $stderr.puts contents
      else
        log("(in stdout)")
        $stdout.puts contents 
      end
      if new_file
        log("Writing to #{new_file}...")
        unless File.file?(new_file)
          File.new(new_file, "w")
        end
        File.write(new_file, contents)
        log("Done writing")
      end
    end
    
    desc 'copy FILE NEW_FILE', 'writes the content of FILE to NEW_FILE'
    def copy(old_file_name, new_file_name)
      log("Starting to read file...")
      contents = File.read(old_file_name)
      f = File.new(new_file_name, "w")
      log("Writing to #{new_file_name}...")
      f.write(contents)
      log("Done writing")
    end

    desc 'touch FILE', 'creates an empty file named FILE'
    def touch(file_name)
      log("Touching file...")
      f = File.new(file_name, "w")
      log("File created")
    end

    no_commands do 
      def log(str)
        puts str if options[:verbose]
      end
    end
    
  end

end