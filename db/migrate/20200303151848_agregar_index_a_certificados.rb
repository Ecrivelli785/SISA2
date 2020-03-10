class AgregarIndexACertificados < ActiveRecord::Migration[6.0]
  def change
  	add_index :certificados, :nro_certificado
  end
end
