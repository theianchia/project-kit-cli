<div id="top"></div>

<!-- PROJECT LOGO -->
<div align="center">
  <h3 align="center">Project Kit CLI Tool</h3>
  <p align="center">
    Developer tool built using Ruby and Thor
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li><a href="#installation">Installation</a></li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#project-kit">Project Kit</a></li>
    <li><a href="#additional-takeaways">Additional Takeaways</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project
* Thor is a toolkit for building CLI interfaces. A Thor class exposes an executable with a number of subcommands where public methods defined become task commands.
* In this repository, you'll find the code for Project Kit and several other examples demonstrating `Thor::Group`, subcommands and generators. 

<p align="right">(<a href="#top">back to top</a>)</p>

### Built With

* [Ruby](https://www.ruby-lang.org/en/)
* [Thor](http://whatisthor.com/)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Installation

  ```sh
  ~ gem install thor
  ```

<p align="right">(<a href="#top">back to top</a>)</p>


## Usage
### Using a `.thor` file

1. Run `thor list` or `thor -T` to see a list of available commands for a thor task 
  ```sh
a
-
thor a:list LINE  # does A stuff

b
-
thor b:dig NAME  # does B stuff

test
----
thor test:goodbye     # say goodbye to the world
thor test:hello NAME  # say hello to NAME
  ```
2. Run `thor help <command>` to see the description and options for a particular command
  ```sh
Usage:
  thor test:hello NAME

Options:
  -y, [--yell], [--no-yell]        # shout hello to NAME
      [--verbose], [--no-verbose]  

say hello to NAME
  ```

<p align="right">(<a href="#top">back to top</a>)</p>

### Using a `.rb` file
Within some examples you may find the following directories and files:

```
├── bin
    └── command
└── lib
    ├── command.rb
    └── sub_task.rb
```

1. To call the lib from the bin file, we need to change the permissions of the file so that it can be executed
  ```sh
  ~ chmod a+x <file> 
  or 
  ~ chmod a+x bin/command
  ```

2. Now, we are able to call it
  ```sh
  ~ ./cli.rb
  Commands:
  cli.rb docs            # create and publish docs
  cli.rb help [COMMAND]  # Describe available commands or one specific command
  
  or 
  
  ~ bin/command
  Commands:
  command anothercounter  # Prints numbers + 2 in sequence
  command count           # Prints numbers in sequence
  command foo             # Prints foo
  command help [COMMAND]  # Describe available commands or one specific command
  ```


<p align="right">(<a href="#top">back to top</a>)</p>

## Project Kit 
Project kit is meant to be a project starter kit to make bootstrapping common development items easy and perform other basic file operations. It is packaged into a gem and can be installed to any system.

### Usage
1. Install missing gem executables
  ```sh
  ~ bundle install
  ```
  
2. Change the permissions so that you can execute the file
  ```sh
  ~ chmod +x exe/proj_kit
  ```

3. Call our lib from the binary file
  ```sh
  ~ bundle exec exe/proj_kit
Commands:
  proj_kit copy FILE NEW_FILE  # writes the content of FILE to NEW_FILE
  proj_kit help [COMMAND]      # Describe available commands or one specific ...
  proj_kit output FILE         # prints the content of FILE
  proj_kit setup               # quick project setup
  proj_kit touch FILE          # creates an empty FILE

Options:
  [--verbose], [--no-verbose]  
  
  ~ bundle exec exe/proj_kit help output
  Usage:
  proj_kit output FILE

Options:
  [--stderr], [--no-stderr]    # prints the content of FILE to STDERR handle
  [--new-file=NEW_FILE]        # writes the content to NEW_FILE
  [--verbose], [--no-verbose]  

prints the content of FILE
  ```

4. Running `bundle exec exe/proj_kit setup --license` would create
  ```
<project>
├── <project>.gemspec
├── Gemfile
├── LICENSE.txt
├── README.md
├── .gitignore
└── lib
      ├── <project>.rb
      └── <project>
          └── version.rb
```

5. Package and install the gem
  ```sh
  ~ gem build proj_kit.gemspec
  ~ gem install proj_kit-1.0.0.gem --local
  ```

6. Run the gem 
  ```sh
  ~ proj_kit
  ```

<p align="right">(<a href="#top">back to top</a>)</p>

### Testing
Run `rspec spec/proj_kit_spec.rb` to test the behavior of the CLI
  ```sh
  ProjKit
    #touch
      creates a new empty file
    #output
  Hello World!
      writes file contents to a new file
    #setup
  Name of your new project: test
  Setting up test...
        create  test/test.gemspec
        create  test/Gemfile
        create  test/README.md
        create  test/.gitignore
        create  test/MITLICENSE
        create  test/lib/test.rb
        create  test/lib/test/version.rb
      setup a gem project

  Finished in 1.38 seconds (files took 0.23491 seconds to load)
  3 examples, 0 failures
  ```

<p align="right">(<a href="#top">back to top</a>)</p>

## Additional Takeaways
* Unlike Thor files, `.start(ARGV)` would need to be added at the end of a Ruby script to instantiate the class and invoke the task
* `Thor::Group` are extended in generators to easily execute all the methods defined in the class in the order they were defined
* Open3#popen3 allows you to interact with the external command while it is running and consolidates all 3 of the std pipes into a single stream
* As each pipe has a limited buffer size, it is important to ensure the stdout streams are continuously read else `stdin.write` will be blocked


<p align="right">(<a href="#top">back to top</a>)</p>
