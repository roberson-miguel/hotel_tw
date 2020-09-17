class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.string :nome
      t.integer :classe

      t.timestamps
    end
  end
end
