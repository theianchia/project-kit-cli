class Test < Thor
  class_option :verbose, :type => :boolean

  desc "hello NAME", "say hello to NAME"
  method_option :yell, :type => :boolean, :aliases => "-y", :desc => "shout hello to NAME"
  def hello(name)
    puts "> saying hello" if options[:verbose]
    output = []
    output << "Hello #{name}"
    output = output.join("\n")
    puts options[:yell] ? output.upcase : output
    puts "> done saying hello" if options[:verbose]
  end

  desc "goodbye", "say goodbye to the world"
  def goodbye(name)
    puts "> saying goodbye" if options[:verbose]
    puts "Goodbye World #{name}"
    puts "> done saying goodbye" if options[:verbose]
  end
end

class A < Thor
  desc "list LINE", "does A stuff"
  method_option :line, :type => :string
  def list
    unless options[:line].nil?
      puts "Line option is #{options[:line]}"
    else
      puts "Line option wasn't passed"
    end
  end
end

class B < Thor
  desc "dig NAME", "does B stuff"
  method_option :name, :type => :string
  def dig
    invoke 'a:list', [], :line => options[:name]
  end
end