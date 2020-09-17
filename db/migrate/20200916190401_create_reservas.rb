class CreateReservas < ActiveRecord::Migration[6.0]
  def change
    create_table :reservas do |t|
      t.integer :type_client
      t.string :date_starting
      t.string :date_exit

      t.timestamps
    end
  end
end
