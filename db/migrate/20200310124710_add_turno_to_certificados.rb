class AddTurnoToCertificados < ActiveRecord::Migration[6.0]
  def change
    add_column :certificados, :turno, :string
  end
end
