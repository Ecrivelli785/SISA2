class Cliente < ApplicationRecord
  has_many :certificados
  has_many :quejas
  CLIENTE_TIPO = ['COMERCIAL', 'INDUSTRIAL', 'PARTICULAR', 'EDUCACIONAL', 'ESTATAL', 'OTROS']
end
