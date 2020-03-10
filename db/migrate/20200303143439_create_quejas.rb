class CreateQuejas < ActiveRecord::Migration[6.0]
  def change
    create_table :quejas do |t|
      t.date :fecha_queja
      t.string :observacion

      t.timestamps
    end
  end
end
