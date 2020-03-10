class AddBarrioToClientes < ActiveRecord::Migration[6.0]
  def change
    add_column :clientes, :barrio, :string
  end
end
