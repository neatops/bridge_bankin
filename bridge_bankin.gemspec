# frozen_string_literal: true

require_relative "lib/bridge_bankin/version"

Gem::Specification.new do |spec|
  spec.name          = "bridge_bankin"
  spec.version       = BridgeBankin::VERSION
  spec.authors       = ["Olivier Buffon"]
  spec.email         = ["olivier@buffon.dev"]

  spec.summary       = "Unofficial Ruby client to consume Bridge by Bankin’ API"

  spec.description   = "Thanks to a safe and automated access to bank data, Bridge powered by Bankin’ provides " \
                       "competitive and smart solutions to build conversion-driver financial services."

  spec.homepage      = "https://github.com/neatops/bridge_bankin"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.6.5")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html

  spec.add_development_dependency "awesome_print"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-rake"
  spec.add_development_dependency "rubocop-rspec"
  spec.add_development_dependency "shoulda-matchers"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end
