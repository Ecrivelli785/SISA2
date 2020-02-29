class Cliente < ApplicationRecord
  has_many :certificados
  CLIENTE_TIPO = ['COMERCIAL', 'INDUSTRIAL', 'PARTICULAR', 'EDUCACIONAL', 'ESTATAL', 'OTROS']
end
