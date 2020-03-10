class AddNroQuejaToQuejas < ActiveRecord::Migration[6.0]
  def change
    add_column :quejas, :nro_queja, :integer
  end
end
