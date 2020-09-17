class ReservasController < ApplicationController
  require 'date'
  require 'time'

  def index
    @reservas = Reserva.all
  end

  def show
    @reserva = Reserva.find(params[:id])
  end

  def new
    @reserva = Reserva.new
    data1 = "16Mar2020(mon)"
    data2 = "20Apr2020(mon)"
    @formatted_data1 = Date.parse(data1).strftime('%d %B %Y %A')
    @formatted_data2 = Date.parse(data2).strftime('%d %B %Y %A')

    @time_data1 = Time.parse(data1)
    @time_data2 = Time.parse(data2)

    @differ = (((@time_data2 - @time_data1)/3600)/24).to_s
    @weekdays = ((Date.parse(data1))..(Date.parse(data2) - 1) ).select {|d| (1..5).include?(d.wday) }.size
    @weekend_days = (@differ.to_i - @weekdays) 

  end

 
  def update
  end
  
  def edit
    @reservas = Rerserva.all
  end
end
