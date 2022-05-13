# frozen_string_literal: true

require_relative "lib/proj_kit/version"

Gem::Specification.new do |spec|
  spec.name = "proj_kit"
  spec.version = ProjKit::VERSION
  spec.authors = ["Ian Chia"]
  spec.email = ["ian.chia@kaligo.com"]

  spec.summary = "Simple project starter kit to perform common file operations from the CLI"
  spec.description = "Simple project starter kit to perform common file operations from the CLI"
  spec.homepage = "https://github.com/theianchia/ruby-cli-tool/proj_kit"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = ""

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/theianchia/ruby-cli-tool/proj_kit"
  spec.metadata["changelog_uri"] = "https://github.com/theianchia/ruby-cli-tool/blob/master/CHANGELOG.md"

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

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "thor", "~> 1.2.1"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
