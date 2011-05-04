# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "scissors/version"

Gem::Specification.new do |s|
  s.name        = "scissors"
  s.version     = Scissors::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jordi Romero"]
  s.email       = ["jordi@jrom.net"]
  s.homepage    = "https://github.com/teambox/scissors"
  s.summary     = %q{Blah bluh}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "scissors"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "thor"
  s.add_dependency "chef"

  s.add_development_dependency "rspec", "~> 2.5.0"
  s.add_development_dependency "cucumber"
  s.add_development_dependency "aruba"
end

