# -*- encoding: utf-8 -*-
require File.expand_path('../lib/enumstats/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Nicholas E. Rabenau"]
  gem.email         = ["nerab@gmx.net"]
  gem.description   = %q{Adds simple stats like average, variance and standard deviation to Enumerable}
  gem.summary       = %q{Stats for Enumerables}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "enumstats"
  gem.require_paths = ["lib"]
  gem.version       = Enumstats::VERSION

  gem.add_development_dependency 'rake'
end