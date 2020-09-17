class CreateTipoClientes < ActiveRecord::Migration[6.0]
  def change
    create_table :tipo_clientes do |t|
      t.string :type_client

      t.timestamps
    end
  end
end
