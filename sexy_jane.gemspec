# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sexy_jane/version"

Gem::Specification.new do |s|
  s.name        = "sexy_jane"
  s.version     = SexyJane::VERSION
  s.authors     = ["Derek Barnes", "Jason Zhao"]
  s.email       = ["derek@bigbento.com", "jasonzhao6@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "sexy_jane"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'fakeweb'
  s.add_runtime_dependency 'koala'
  s.add_runtime_dependency 'capybara'
end
