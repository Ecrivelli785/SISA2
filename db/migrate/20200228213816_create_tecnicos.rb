class CreateTecnicos < ActiveRecord::Migration[6.0]
  def change
    create_table :tecnicos do |t|
      t.bigint :dni
      t.string :apellido
      t.string :nombre
      t.string :domicilio
      t.longtext :observaciones_tecnico
      t.string :telefono
      t.boolean :estado

      t.timestamps
    end
  end
end
