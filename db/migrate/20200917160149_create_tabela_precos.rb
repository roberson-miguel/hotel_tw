class CreateTabelaPrecos < ActiveRecord::Migration[6.0]
  def change
    create_table :tabela_precos do |t|
      t.references :hotel, null: false, foreign_key: true
      t.references :tipo_cliente, null: false, foreign_key: true
      t.references :periodo, null: false, foreign_key: true
      t.float :preco

      t.timestamps
    end
  end
end
