# frozen_string_literal: true

require_relative "project_kit/setup"
require_relative "project_kit/sync"
require 'thor'

module ProjectKit
  class CLI < Thor
    register(ProjectKit::SetUp, "setup", "setup", "initial ruby project setup")
    register(ProjectKit::Sync, "sync", "sync", "compares project templates with an existing target app directory")
  end
end