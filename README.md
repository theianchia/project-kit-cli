<div id="top"></div>

<!-- PROJECT LOGO -->
<div align="center">
  <h3 align="center">Developer CLI Tool</h3>
  <p align="center">
    Simple CLI tool examples built using Ruby and Thor
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
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project
* Thor is a toolkit for building CLI interfaces. A Thor class exposes an executable with a number of subcommands where public methods defined become task commands.
* In the repository, you'll find several examples using Thor to create `Thor::Group`, subcommands and generators. 

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


## File Structure

Within some examples you may find the following directories and files:

```
├── bin
	└── command
└── lib
	├── command.rb
	└── sub_task.rb
```

<p align="right">(<a href="#top">back to top</a>)</p>


## Usage
If you are using a `.thor` file

1. Run `thor list` to see the commands available for a thor task 
  ```sh
  test
----
thor test:example FILE            # an example task that does something with a file
thor test:goodbye                 # say goodbye to the world
thor test:hello NAME --from=FROM  # say hello to NAME
thor test:one                     # Prints 1 2 3
thor test:test FILE               # an example task that test a file
thor test:three                   # Prints 3
thor test:two                     # Prints 2 3
  ```
2. Run `thor help <command>` to see the description and options for a particular command
  ```sh
  Usage:
  thor test:example FILE

Options:
  -d, [--delete=DELETE]            # Delete the file after parsing it
      [--verbose], [--no-verbose]  

an example task that does something with a file
  ```

If you are using a `.rb` file

1. To call the lib from the bin file, you need to change the permissions of the file so that it can be executed
  ```sh
  ~ chmod a+x <file>
  ```

2. Now, we are able to call it
  ```sh
  Commands:
  mythorcommand.rb foo             # Prints foo
  mythorcommand.rb help [COMMAND]  # Describe available commands or one specific command
  ```

## Additional Takeaways


