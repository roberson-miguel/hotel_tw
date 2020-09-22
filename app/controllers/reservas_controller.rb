class ReservasController < ApplicationController
  require 'date'
  require 'time'

  before_action :set_find, only: [:show, :edit, :update, :destroy]

  def index
    @reservas = Reserva.all
  end

  def show
    @tabela_precos = TabelaPreco.all
    @reservas = Reserva.all
    @tipo_clientes = TipoCliente.all
  
    @differ = calcula_dias_corridos(@reserva.date_starting, @reserva.date_exit)
    @weekdays = calcula_dias_semana(@reserva.date_starting, @reserva.date_exit)
    @weekend_days = calcula_dias_fim_de_semana(@differ, @weekdays)


    @totalReserva = 0
    @tabela_preco_total = []
    @tabela_precos.each do |tabela_preco|
      if tabela_preco.tipo_cliente.type_client == @reserva.tipo_cliente.type_client
        if @weekdays > 0 || @weekend_days > 0 
          @tabela_preco_total << [tabela_preco.hotel.nome, @totalReserva + (tabela_preco.preco * @weekdays ) + (tabela_preco.preco * @weekend_days)]
          #@tabela_preco_total << [@totalReserva + (tabela_preco.preco * @weekdays ) + (tabela_preco.preco * @weekend_days)]
        end
      # else
      #     @tabela_preco_total << "Sem dados Tipo #{@reserva.tipo_cliente.type_client}"
      #     break
      end
    end

  end

  def calcula_dias_corridos(date_starting, date_exit)
    @time_date_starting = Time.parse(date_starting)
    @time_date_exit = Time.parse(date_exit)
    (((@time_date_exit - @time_date_starting)/3600)/24).to_s
  end

  def calcula_dias_semana(date_starting, date_exit)
    ((Date.parse(date_starting))..(Date.parse(date_exit)) ).select {|d| (1..5).include?(d.wday) }.size
  end

  def calcula_dias_fim_de_semana(differ, weekdays)
    (@differ.to_i - @weekdays) 
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

  def edit
    @reservas = Reserva.all
    @tipo_clientes = TipoCliente.all
  end
 
  def update
    if @reserva.update(reserva_params)
      redirect_to @reserva
    else
      render :edit
    end
  end

  def destroy
    @reserva.destroy
    redirect_to @reserva, notice: "Reserva excluida com sucesso!"
  end

end


private

def reserva_params
  params.require(:reserva).permit(:tipo_cliente_id, :date_starting, :date_exit)
end

def set_find
   @reserva = Reserva.find(params[:id])
end


# @formatted_data1 = Date.parse(data1).strftime('%d %B %Y %A')
# @formatted_data2 = Date.parse(data2).strftime('%d %B %Y %A')


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