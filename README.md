<div id="top"></div>

<!-- PROJECT LOGO -->
<div align="center">
  <h2>Project Kit CLI</h2>
  <img src="images/demo.gif" alt="demo">
  <p>Dev-focused Ruby CLI tool to improve propagation efficiency</p>
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
* Project Kit is a ruby project starter kit that makes bootstrapping and syncing common development items easy. 
  * It aims to speed up ruby projects by hosting these development templates in a centralised directory as a single source of truth and propagate changes to multiple projects all from a single point.
  * Project Kit is built using `Thor`, a toolkit for building CLI interfaces. A `Thor` class exposes an executable with a number of subcommands where public methods defined become task commands.


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

2. Run `thor help <command>` to see the description and options for a particular command

### Using a `.rb` file
Within some projects you may find the following directory:

```
├── bin
    └── command
└── lib
    ├── command.rb
    └── subcommand.rb
```

1. To call lib, we need to change the permissions of our bin script so that it can be executed
  ```sh
  ~ chmod a+x <file> 
  or 
  ~ chmod a+x bin/command
  ```

2. Now, we are able to call it by running `./<file>` or `bin/command`

<p align="right">(<a href="#top">back to top</a>)</p>

## Project Kit 

### Usage
1. Install missing gem executables
  ```sh
  ~ bundle install
  ```
  
2. Change the permissions so that the script can be executed
  ```sh
  ~ chmod +x exe/project_kit
  ```

3. Call lib by executing `exe/project_kit` in the current context of bundle
  ```sh
  ~ bundle exec exe/project_kit
Commands:
  project_kit help [COMMAND]  # Describe available commands or one specific command
  project_kit setup           # initial ruby project setup
  project_kit sync            # compares project templates with an existing target app directory  


  ~ bundle exec exe/project_kit setup gem 
name of your new project: hello
setting up hello...
      create  ../hello/.gitignore
      create  ../hello/.ruby-version
      create  ../hello/Gemfile
      create  ../hello/LICENSE.txt
hello gem project successfully setup
 
  
  ~ bundle exec exe/project_kit sync gem -t ../hello
finding ../hello
   identical  ../hello/.gitignore
   identical  ../hello/.ruby-version
   identical  ../hello/Gemfile
   identical  ../hello/LICENSE.txt
+--------------+----------------+
| Synced Files | Unsynced Files |
+--------------+----------------+
|.gitignore    |                |
|.ruby-version |                |
|Gemfile       |                |
|LICENSE.txt   |                |
+--------------+----------------+
  ```

4. Package and install the gem
  ```sh
  ~ gem build project_kit.gemspec
  ~ gem install project_kit-1.0.0.gem --local
  ```

5. Run the gem 
  ```sh
  ~ project_kit
  ```

<p align="right">(<a href="#top">back to top</a>)</p>

### Testing
Run `rspec spec/project_kit_spec.rb` to test the behavior of the CLI
  ```sh
ProjectKit
  #setup
name of your new project: test
setting up test...
      create  project-kit-cli/test/.gitignore
      create  project-kit-cli/test/.ruby-version
      create  project-kit-cli/test/Gemfile
      create  project-kit-cli/test/LICENSE.txt
test gem project successfully setup
    initial setup of a gem project
  #sync
finding ../test
   identical  project-kit-cli/test/.gitignore
   identical  project-kit-cli/test/.ruby-version
   identical  project-kit-cli/test/Gemfile
   identical  project-kit-cli/test/LICENSE.txt
+--------------+----------------+
| Synced Files | Unsynced Files |
+--------------+----------------+
|.gitignore    |                |
|.ruby-version |                |
|Gemfile       |                |
|LICENSE.txt   |                |
+--------------+----------------+
    sync gem templates to ../test directory

Finished in 1.18 seconds (files took 0.36764 seconds to load)
2 examples, 0 failures
  ```

<p align="right">(<a href="#top">back to top</a>)</p>

## Additional Takeaways
* Unlike Thor files, `.start(ARGV)` would need to be added at the end of a Ruby script to instantiate the class and invoke the task
* Ruby relies on absolute paths while Thor relies on relative paths, hence the need to resolve the path difference when accessing templates
* In Project Kit, a `File.file?` check was performed to ensure that the current iterable is a file and not a directory, as by default `template()` creates a copy of a file which might lead to subsequent file clashes 
  * eg. a file clash between `.github` and `.github/PULL_REQUEST_TEMPLATE.md`
* Open3#popen3 allows you to interact with the external command while it is running and consolidates all 3 of the std pipes into a single stream
* As each pipe has a limited buffer size, it is important to ensure the stdout streams are continuously read else `stdin.write` will be blocked

<p align="right">(<a href="#top">back to top</a>)</p>
