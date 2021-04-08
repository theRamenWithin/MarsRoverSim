require_relative "lib/MarsRoverSim/version"

Gem::Specification.new do |spec|
  spec.name          = "MarsRoverSim"
  spec.version       = MarsRoverSim::VERSION
  spec.authors       = ["Alex Pike"]
  spec.email         = ["55725286+theRamenWithin@users.noreply.github.com"]

  spec.summary       = "This program is an AutomicGroup assignment written in Ruby by Alex Pike applying for the role of Junior Full Stack Developer."
  spec.homepage      = "https://github.com/theRamenWithin"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
