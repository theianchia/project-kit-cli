class Newgem < Thor::Group
    include Thor::Actions
  
    # Define arguments and options
    argument :name
    class_option :test_framework, :default => :test_unit
    namespace :createfile 
  
    def self.source_root
      put relative_to_original_destination_root(destination_root, false)
      put source_paths
      puts File.dirname(__FILE__)
      File.dirname(__FILE__)
    end
  
    def create_lib_file
      template("template/newgem.tt", "#{name}/lib/#{name}.rb")
    end
  
    def create_test_file
      test = options[:test_framework] == "rspec" ? :spec : :test
      create_file "#{name}/#{test}/#{name}_#{test}.rb"
    end
  
    def copy_licence
      if yes?("Use MIT license?")
        # Make a copy of the MITLICENSE file at the source root
        copy_file "MITLICENSE", "#{name}/MITLICENSE"
      else
        say "Shame on you…", :red
      end
    end
  end