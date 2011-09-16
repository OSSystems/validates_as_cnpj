# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "validates_as_cnpj/version"

Gem::Specification.new do |s|
  s.name        = "validates_as_cnpj"
  s.version     = ValidatesAsCnpj::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["André Camargo",
                   "Luis Gustavo S. Barreto",
                   "Otávio Salvador",
                   "Vinicius Alves Hax"]
  s.email       = ["andre@boaideia.inf.br",
                   "gustavo@ossystems.com.br",
                   "otavio@ossystems.com.br",
                   "viniciushax@gmail.com"]
  s.homepage    = "http://www.ossystems.com.br/"
  s.summary     = %q{Adiciona validação de CNPJ ao ActiveRecord}
  s.description = %q{Uma gem configurável que adiciona validação de CNPJ a qualquer modelo do ActiveRecord, de forma semelhante como funciona as validações padrão.}

  s.rubyforge_project = "validates_as_cnpj"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
