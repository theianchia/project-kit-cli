# frozen_string_literal: true

require "thor"
require "pathname"
require "tty-table"

module ProjectKit
  class SyncFiles < Thor::Group
    include Thor::Actions
    class_option :details

    def self.source_root
      File.dirname(__FILE__)
    end

    def compare_target_directory_files
      type, targets = options[:details].fetch_values(:type, :target)
      targets.each do |target|
        unsynced = []
        synced = []
        say "\nfinding #{target}", :green
        return say "could not find #{target} directory", :red unless Dir.exist?(target)
        return say "could not find #{type} template directory", :red unless Dir.exist?("#{TEMPLATE_PATH}/#{type}")
        Dir.glob("#{TEMPLATE_PATH}/#{type}/**/*", File::FNM_DOTMATCH) do |abs_file_path|
          file_pathname = Pathname.new(abs_file_path)
          template_pathname = Pathname.new("#{TEMPLATE_PATH}/#{type}")
          file = file_pathname.relative_path_from(template_pathname).to_s
          unless (['.', '..'].include?(file) or file.include?('.DS_Store'))
            if File.file?(abs_file_path)
              template("../templates/#{type}/#{file}", "#{target}/#{file}")
              file_content = File.read("#{target}/#{file}")
              template_content = File.read(abs_file_path)
              if file_content == template_content then synced.append(file) else unsynced.append(file) end
            end 
          end
        end
        result = synced.zip(unsynced).to_a
        table = TTY::Table.new([{value:" Synced Files ", alignment: :center}, {value:" Unsynced Files ", alignment: :center}], result)
        puts table.render(:ascii, alignment: [:left])
      end
    end 
  end

  class Sync < Thor
    class_option :target, :type => :string, aliases: "-t", repeatable: true, desc: "specify a filepath to a target app project directory", required: true

    def self.exit_on_failure?
      true
    end

    desc 'hanami', 'sync hanami file templates for a project into a target app directory'
    def hanami
      obj = {type: "hanami", target: options[:target]}
      invoke SyncFiles, [], :details => obj 
    end

    desc 'rails', 'sync rails file templates for a project into a target app directory'
    def rails
      obj = {type: "rails", target: options[:target]}
      invoke SyncFiles, [], :details => obj 
    end

    desc 'gem', 'sync gem file templates for a project into a target gem directory'
    def gem
      obj = {type: "gem", target: options[:target]}
      invoke SyncFiles, [], :details => obj 
    end
  end
end