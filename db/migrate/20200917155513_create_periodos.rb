class CreatePeriodos < ActiveRecord::Migration[6.0]
  def change
    create_table :periodos do |t|
      t.string :periodo

      t.timestamps
    end
  end
end
