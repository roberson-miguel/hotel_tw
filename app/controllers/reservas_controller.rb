class ReservasController < ApplicationController
    require 'date'
    require 'time'

    before_action :set_find, only: [:show, :edit, :update, :destroy]

    def index
      @reservas = Reserva.all
      @tipo_clientes = TipoCliente.all
    end

    def show
      @tabela_precos = TabelaPreco.all
      @reservas = Reserva.all
      @tipo_clientes = TipoCliente.all
    
      @differ = calcula_dias_corridos(@reserva.date_starting, @reserva.date_exit)
      @weekdays = calcula_dias_semana(@reserva.date_starting, @reserva.date_exit)
      @weekend_days = (@differ.to_i - @weekdays)


      @totalReserva = 0
      @tabela_preco_total = []
      @tabela_preco_semana = []
      @tabela_preco_fds = []

            # @tabela_precos.each do |tabela_preco|
            #   if tabela_preco.tipo_cliente.type_client == @reserva.tipo_cliente.type_client
            #     if @weekdays >= 1 || @weekend_days >=1 
            #       @tabela_preco_total << {nome: tabela_preco.hotel.nome, 
            #                               periodo: tabela_preco.periodo.periodo, 
            #                               tipo_cliente: tabela_preco.tipo_cliente.type_client,
            #                               total_semana: (@weekdays * tabela_preco.preco),
            #                               total_fim_de_semana: (@weekend_days * tabela_preco.preco)}
            #                              # total: (@totalReserva + (@weekdays * tabela_preco.preco)+(@weekend_days * tabela_preco.preco))}
            #     end
            #   end
            # end

            @tabela_precos.each do |tabela_preco|
              if tabela_preco.tipo_cliente.type_client == @reserva.tipo_cliente.type_client
                if @weekdays > 0 && tabela_preco.periodo.periodo == "Semana"
                  @tabela_preco_semana << {nome: tabela_preco.hotel.nome, 
                                          periodo: tabela_preco.periodo.periodo, 
                                          tipo_cliente: tabela_preco.tipo_cliente.type_client,
                                          total: (@weekdays * tabela_preco.preco)}
                                         #total_fim_de_semana: (@weekend_days * tabela_preco.preco)}
                                         # total: (@totalReserva + (@weekdays * tabela_preco.preco)+(@weekend_days * tabela_preco.preco))}
                  end
              end
            end

            @tabela_precos.each do |tabela_preco|
              if tabela_preco.tipo_cliente.type_client == @reserva.tipo_cliente.type_client
                if @weekend_days > 0 && tabela_preco.periodo.periodo == "Fim de semana"
                  @tabela_preco_fds << {nome: tabela_preco.hotel.nome, 
                                          periodo: tabela_preco.periodo.periodo, 
                                          tipo_cliente: tabela_preco.tipo_cliente.type_client,
                                          total: (@weekend_days * tabela_preco.preco)}
                                         #total_fim_de_semana: (@weekend_days * tabela_preco.preco)}
                                         # total: (@totalReserva + (@weekdays * tabela_preco.preco)+(@weekend_days * tabela_preco.preco))}
                end
              end
            end

            @tabela_preco_semana.each do |tab1|
              @tabela_preco_fds.each do |tab2|
                if tab1[:nome] == tab2[:nome]
                  @tabela_preco_total << {nome: tab2[:nome], total: (tab1[:total]+tab2[:total])}
                end
              end
            end

    end

    def calcula_dias_corridos(date_starting, date_exit)
      @time_date_starting = Time.parse(date_starting)
      @time_date_exit = Time.parse(date_exit)
      (((@time_date_exit - @time_date_starting) / 3600 )/24)
    end

    def calcula_dias_semana(date_starting, date_exit)
      (((Date.parse(date_starting))..(Date.parse(date_exit)) ).select {|d| (1..5).include?(d.wday) }.size - 1 )
    end

    def calcula_dias_fim_de_semana(differ, weekdays)
      (@differ.to_i - @weekdays.to_i) 
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

  private

  def reserva_params
    params.require(:reserva).permit(:tipo_cliente_id, :date_starting, :date_exit)
  end

  def set_find
    @reserva = Reserva.find(params[:id])
  end

end

