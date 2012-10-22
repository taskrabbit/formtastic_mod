# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'formtastic_mod/version'

Gem::Specification.new do |gem|
  gem.name          = "formtastic_mod"
  gem.version       = FormtasticMod::VERSION
  gem.authors       = ["Mike Nelson"]
  gem.email         = ["mike@mikeonrails.com"]
  gem.description   = 'Formtastic Modifications and Overrides'
  gem.summary       = 'Formtastic Modifications'
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
