
require File.dirname(__FILE__) + '/abstract_unit'
require '../lib/validates_as_cnpj'

# Modelo
class CNPJData < ActiveRecord::Base
  set_table_name "cnpjs"

  validates_as_cnpj :cnpj
end

# Testes
class CNPJsTest < Test::Unit::TestCase
  def test_cnpj_invalido
    cnpj_invalido = CNPJData.create(:id => 1, :cnpj => "51.357.999/1110-98")
    cnpj_invalido.save

    assert ( not cnpj_invalido.save ), "CNPJ invalido foi salvo."
  end

  def test_cnpj_valido
    cnpj_valido = CNPJData.create(:id => 1, :cnpj => "94.132.024/0001-48")
    cnpj_valido.save

    assert ( cnpj_valido.save ), "CNPJ valido nao foi salvo."
  end
end
