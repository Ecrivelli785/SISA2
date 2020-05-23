class Queja < ApplicationRecord
	belongs_to :cliente
	belongs_to :certificado

	def certificado_nro
		certificado.try(:nro_certificado)
	end

	def certificado_nro=(nro_certificado)
		self.certificado = Certificado.find_by_nro_certificado(nro_certificado) if nro_certificado.present?
	end
end
