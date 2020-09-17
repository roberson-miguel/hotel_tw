class ReservasController < ApplicationController
  require 'date'
  require 'time'

  before_action :set_find, only: [:show, :edit, :update, :destroy]

  def index
    @reservas = Reserva.all
  end

  def show
    @reservas = Reserva.all
    @tipo_clientes = TipoCliente.all
  end

  def new
    @reserva = Reserva.new
    @tipo_clientes = TipoCliente.all
  end

  def create
      @reserva = Reserva.new(reserva_params)
      @tipo_clientes = TipoCliente.all
    if @reserva.save
      flash[:notice] = 'Reserva efetuada com sucesso!'
      redirect_to @reserva
    else
      flash[:alert] = 'Erro'
      render :new
    end
  end

 
  def update
  end
  
  def edit
    @reservas = Rerserva.all
  end
end


private

def reserva_params
  params.require(:reserva).permit(:tipo_cliente_id, :date_starting, :date_exit)
end

def set_find
   @reserva = Reserva.find(params[:id])
end


# data1 = "16Mar2020(mon)"
# data2 = "20Apr2020(mon)"
# @formatted_data1 = Date.parse(data1).strftime('%d %B %Y %A')
# @formatted_data2 = Date.parse(data2).strftime('%d %B %Y %A')

# @time_data1 = Time.parse(data1)
# @time_data2 = Time.parse(data2)

# @differ = (((@time_data2 - @time_data1)/3600)/24).to_s
# @weekdays = ((Date.parse(data1))..(Date.parse(data2) - 1) ).select {|d| (1..5).include?(d.wday) }.size
# @weekend_days = (@differ.to_i - @weekdays) 


#Como usar as data no controller
# require 'date'
# # Calculate the number of weekdays since 14 days ago
# p ( (Date.today - 14)..(Date.today) ).select {|d| (1..5).include?(d.wday) }.size
# É assim que eu usaria no seu caso.

# class Product
#   def days_late
#     weekdays_in_date_range( self.due_date..(Date.today) )
#   end

#   protected
#   def weekdays_in_date_range(range)
#     # You could modify the select block to also check for holidays
#     range.select { |d| (1..5).include?(d.wday) }.size
#   end
# end