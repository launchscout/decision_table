# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "decision_table/version"

Gem::Specification.new do |s|
  s.name        = "decision_table"
  s.version     = DecisionTable::VERSION
  s.authors     = ["Chris Nelson"]
  s.email       = ["superchrisnelson@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Table driven decision logic in ruby}
  s.description = %q{If you have decision algorithm that can be easily expressed in a table, this gem can help}

  s.rubyforge_project = "decision_table"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-given"
  s.add_development_dependency "pry"
  s.add_runtime_dependency "activesupport"
end
