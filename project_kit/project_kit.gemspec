# frozen_string_literal: true

require_relative "lib/project_kit/version"

Gem::Specification.new do |spec|
  spec.name = "project_kit"
  spec.version = ProjectKit::VERSION
  spec.authors = ["Ian Chia"]
  spec.email = ["theianchia@gmail.com"]

  spec.summary = "Simple project starter kit to perform common file operations from the CLI"
  spec.description = "Simple project starter kit to perform common file operations from the CLI"
  spec.homepage = "https://github.com/theianchia/project-kit-cli/project_kit"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = ""

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/theianchia/project-kit-cli/project_kit"
  spec.metadata["changelog_uri"] = "https://github.com/theianchia/project-kit-cli/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~> 1.2.1"
  spec.add_dependency "tty-table", "~> 0.12.0"
end
