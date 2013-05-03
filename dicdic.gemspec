# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'dicdic'

Gem::Specification.new do |s|
  s.name        = "dicdic"
  s.authors     = ["Rangken"]
  s.email       = "rangken@gmail.com"
  s.homepage    = "http://rangken.github.io"
  s.version     = Dicdic::VERSION
  s.platform    = Gem::Platform::RUBY
  s.summary     = "DicDic"
  s.description = ""

  s.add_development_dependency "rspec", "~> 0.6.1"
  s.add_development_dependency "rake",  "~> 0.9.2"

  s.add_dependency "commander", "~> 4.1.2"
  s.add_dependency "terminal-table", "~> 1.4.5"
  s.add_dependency "term-ansicolor", "~> 1.0.7"
  s.add_dependency "mechanize", "~> 2.5.1"
  s.add_dependency "locale", "~> 2.0.8"

  s.files         = Dir["./**/*"].reject { |file| file =~ /\.\/(bin|log|pkg|script|spec|test|vendor)/ }
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.executables << 'dicdic'
end
