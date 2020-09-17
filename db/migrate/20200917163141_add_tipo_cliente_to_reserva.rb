class AddTipoClienteToReserva < ActiveRecord::Migration[6.0]
  def change
    add_reference :reservas, :tipo_cliente, null: false, foreign_key: true
  end
end
