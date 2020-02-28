class CreateCertificados < ActiveRecord::Migration[6.0]
  def change
    create_table :certificados do |t|
      t.integer :nro_certificado
      t.date :fecha_aplicacion
      t.date :fecha_vencimiento
      t.time :hora_aplicacion
      t.string :tratamiento
      t.string :vector
      t.string :superficie
      t.string :droga
      t.string :codigo
      t.longtext :observaciones_certificado
      t.boolean :estado
      t.references :cliente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
