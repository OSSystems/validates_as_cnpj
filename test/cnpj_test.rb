require File.dirname(__FILE__) + '/abstract_unit'
require '../lib/validates_as_cnpj'

# Modelo
class CNPJData < ActiveRecord::Base
  set_table_name "cnpjs"
end

# Testes
class CNPJsTest < Test::Unit::TestCase
  def test_cnpj_invalido
    CNPJData.validates_as_cnpj :cnpj

    cnpj_invalido = CNPJData.create(:id => 1, :cnpj => "51.357.999/1110-98")
    cnpj_invalido.save

    assert ( cnpj_invalido.errors.on(:cnpj) != nil ),
             "CNPJ invalido foi salvo."
  end

  def test_cnpj_valido
    CNPJData.validates_as_cnpj :cnpj

    cnpj_valido = CNPJData.create(:id => 1, :cnpj => "94.132.024/0001-48")
    cnpj_valido.save

    assert ( cnpj_valido.errors.on(:cnpj) == nil ),
             "CNPJ valido nao foi salvo."
  end
end
