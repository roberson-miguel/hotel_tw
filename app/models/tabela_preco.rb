class TabelaPreco < ApplicationRecord
  belongs_to :hotel
  belongs_to :tipo_cliente
  belongs_to :periodo
end
