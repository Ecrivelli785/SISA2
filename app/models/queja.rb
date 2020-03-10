class Queja < ApplicationRecord
	belongs_to :cliente
	belongs_to :certificado
end
