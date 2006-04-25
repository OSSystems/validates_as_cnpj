module ValidaCNPJ
  def self.valida_cnpj(cnpj = nil)
    return nil if cnpj.nil?
    
    nulos = %w{11111111111111
               22222222222222
               33333333333333
               44444444444444
               55555555555555
               66666666666666
               77777777777777
               88888888888888
               99999999999999
               00000000000000}

    valor = cnpj.scan /[0-9]/

    fatores = [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]

    if valor.length == 14
      unless nulos.member? valor.join
        valor = valor.collect{|x| x.to_i}
        
        soma = 0
        0.upto(11) do |i|
          soma += valor[i] * fatores[i]
        end

        soma = soma - (11 * (soma / 11))       
        dv1 = soma < 2 ? 0 : 11 - soma

        if dv1 == valor[12]
          soma = 0
          0.upto(12) do |i|
            soma += valor[i] * (i == 0 ? 6 : fatores[i-1])
         end

          soma = soma - (11 * (soma /11))
          dv2 = soma < 2 ? 0 : 11 - soma

          return true if dv2 == valor[13]
        end
      end
    end
    return nil
  end
end

module ActiveRecord
  module Validations
    module ClassMethods
      def validates_as_cnpj(*attr_names)
        configuration = { :message => "cnpj inválido" }
        configuration.update(attr_names.pop) if attr_names.last.is_a?(Hash)

        validates_each(attr_names, configuration) do |record, attr_name, value|
          value_before_type_cast = record.send("#{attr_name}_before_type_cast")
        
          next if value.empty?

          unless ValidaCNPJ::valida_cnpj(value)
            record.errors.add(attr_name, configuration[:message])
          end
        end
      end
    end
  end
end
