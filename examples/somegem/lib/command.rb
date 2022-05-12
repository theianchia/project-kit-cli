require "thor"
require File.expand_path("lib/mycounter_file", Dir.pwd)
require File.expand_path("lib/anothercounter", Dir.pwd)

module MyAwesomeGem
  class MyCommand < Thor
    desc "foo", "Prints foo"
    def foo
      puts "foo"
    end
    
    # register(class_name, subcommand_alias, usage_list_string, description_string)
    register(MyAwesomeGem::MyCounter, "counter", "counter", "Prints some numbers in sequence")
    register(MyAwesomeGem::AnotherCounter, "counter2", "counter2", "Prints some numbers + 2 in sequence")
  end
end