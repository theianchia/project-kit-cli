class Sub < Thor
    desc "command", "an example task"
    def command
      puts "I'm a thor task!"
    end
  end