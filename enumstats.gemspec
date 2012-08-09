# -*- encoding: utf-8 -*-
require File.expand_path('../lib/enumstats/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Nicholas E. Rabenau"]
  gem.email         = ["nerab@gmx.net"]
  gem.description   = %q{Adds simple stats like average, variance and standard deviation to Enumerable}
  gem.summary       = %q{Stats for Enumerables}
  gem.homepage      = "https://github.com/nerab/enumstats"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "enumstats"
  gem.require_paths = ["lib"]
  gem.version       = Enumstats::VERSION

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'open4'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'hms', '~> 0.0.3'

  gem.add_development_dependency 'guard-minitest', '~> 0.5'
  gem.add_development_dependency 'guard-bundler', '~> 1.0'
  gem.add_development_dependency 'coolline', '~> 0.3'
  gem.add_development_dependency 'growl'
end
