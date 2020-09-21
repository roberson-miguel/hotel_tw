class TabelaPrecosController < ApplicationController

  before_action :set_find, only: [:show, :edit, :update, :destroy]

  def index
    @tabela_precos = TabelaPreco.all
    @hoteis = Hotel.all
    @tipo_clientes = TipoCliente.all
    @periodos = Periodo.all
  end

  def show
    @tabela_precos = TabelaPreco.all
    @reservas = Reserva.all
    @tipo_clientes = TipoCliente.all
    
  end


  def create
    @tabela_preco = TabelaPreco.new(tabela_preco_params)
    @hoteis = Hotel.all
    @tipo_clientes = TipoCliente.all
    @periodos = Periodo.all
  if @tabela_preco.save
    flash[:notice] = 'Preco incluido com sucesso na tabela!'
    redirect_to @tabela_preco
  else
    flash[:alert] = 'Erro'
    render :new
  end
end

  def new
    @tabela_preco = TabelaPreco.new
    @hoteis = Hotel.all
    @tipo_clientes = TipoCliente.all
    @periodos = Periodo.all
  end

 
  def update
    if @tabela_preco.update(tabela_preco_params)
      redirect_to @tabela_preco
    else
      render :edit
    end
  end
  
  def edit
    @tabela_precos = TabelaPreco.all
    @hoteis = Hotel.all
    @tipo_clientes = TipoCliente.all
    @periodos = Periodo.all
  end

  def destroy
    @tabela_preco.destroy
    redirect_to @tabela_preco, notice: "Preço excluido com sucesso na tabela!"
  end
end

private

def tabela_preco_params
  params.require(:tabela_preco).permit(:hotel_id, :tipo_cliente_id, :periodo_id, :preco)
end

def set_find
   @tabela_preco = TabelaPreco.find(params[:id])
end