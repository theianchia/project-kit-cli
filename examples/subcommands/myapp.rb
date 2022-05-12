require 'thor'
require "sub"

class MyApp < Thor
  desc "parentcommand SUBCOMMAND", "Some Parent Command"
  subcommand "sub", Sub
end

MyApp.start