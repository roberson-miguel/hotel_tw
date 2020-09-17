class ReservasController < ApplicationController
  require 'date'

  def index
    @reservas = Reserva.all
  end

  def show
    @reserva = Reserva.find(params[:id])
  end

  def new
    @reserva = Reserva.new
    text = "16Mar2020(mon)"
    @formatted_date = Date.parse(text).strftime('%d %B %Y (%A)')
   
  end

  def update
  end
  
  def edit
    @reservas = Rerserva.all
  end
end
