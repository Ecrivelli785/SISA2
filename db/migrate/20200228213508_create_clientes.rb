class CreateClientes < ActiveRecord::Migration[6.0]
  def change
    create_table :clientes do |t|
      t.string :apellido
      t.string :nombre
      t.string :domicilio
      t.string :celular
      t.string :telefono
      t.boolean :estado
      t.boolean :estado_mkt
      t.string :cuit
      t.string :correo
      t.string :observaciones_cliente
      t.string :rubro
      t.string :cliente_tipo

      t.timestamps
    end
  end
end
