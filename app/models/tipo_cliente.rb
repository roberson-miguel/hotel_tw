class TipoCliente < ApplicationRecord
  has_many :reservas
  has_many :tabela_precos
end
