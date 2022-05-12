require "thor"
require File.expand_path("lib/mycounter", Dir.pwd)
require File.expand_path("lib/anothercounter", Dir.pwd)

module SomeGem
  class MyCommand < Thor
    desc "foo", "Prints foo"
    def foo
      puts "foo"
    end
    
    # register(class_name, subcommand_alias, usage_list_string, description_string)
    register(SomeGem::MyCounter, "counter", "counter", "Prints numbers in sequence")
    register(SomeGem::AnotherCounter, "anothercounter", "anothercounter", "Prints numbers + 2 in sequence")
  end
end