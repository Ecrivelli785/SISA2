class AddEstadoToQuejas < ActiveRecord::Migration[6.0]
  def change
    add_column :quejas, :estado, :boolean
  end
end
