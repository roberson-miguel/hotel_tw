class Reserva < ApplicationRecord

  enum type_client: { "Regular": 0, "Fidelidade": 15}

  def set_default_type_client
      self.type_client ||= :"Regular"
  end
end
