require_relative 'lib/calculator/version'

Gem::Specification.new do |spec|
  spec.name          = "calculator"
  spec.version       = Calculator::VERSION
  spec.authors       = ["Alexander Shapalov"]
  spec.summary       = %q{Calculator commission}
  spec.description   = %q{The calculator is a gem for calculatorulating some commission}
  spec.homepage      = "https://rubygems.org/gems/calculator30"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
