#!/usr/bin/env ruby

require 'thor'

class SubCommandBase < Thor
  def self.banner(command, namespace = nil, subcommand = false)
    "#{basename} #{subcommand_prefix} #{command.usage}"
  end

  def self.subcommand_prefix
    self.name.gsub(%r{.*::}, '').gsub(%r{^[A-Z]}) { |match| match[0].downcase }.gsub(%r{[A-Z]}) { |match| "-#{match[0].downcase}" }
  end
end

module App
  class Docs < SubCommandBase
    desc "create", "create docs"
    def create
      # create
    end

    desc "publish", "publish docs"
    def publish
      # publish
    end
  end

  class CLI < Thor
    desc "docs", "create and publish docs"
    subcommand "docs", Docs
  end
end

App::CLI.start