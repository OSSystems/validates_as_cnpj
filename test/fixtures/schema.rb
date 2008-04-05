ActiveRecord::Schema.define do
  create_table :cnpjs, :force => true do |t|
    t.column :cnpj, :string, :null => true
  end
end
