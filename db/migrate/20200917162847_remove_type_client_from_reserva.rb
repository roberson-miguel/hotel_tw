class RemoveTypeClientFromReserva < ActiveRecord::Migration[6.0]
  def change
    remove_column :reservas, :type_client, :integer
  end
end
