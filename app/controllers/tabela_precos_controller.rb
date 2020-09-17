class TabelaPrecosController < ApplicationController

  def index
    @tabela_preco = TabelaPreco.new
    @hoteis = Hotel.all
    @tipo_clientes = TipoCliente.all
    @periodos = Periodo.all
  end

  def show
    
  end

  def new
    @tabela_preco = TabelaPreco.new
    @hoteis = Hotel.all
    @tipo_clientes = TipoCliente.all
    @periodos = Periodo.all
  end

 
  def update
  end
  
  def edit
    @tabela_preco = TabelaPreco.new
    @hoteis = Hotel.all
    @tipo_clientes = TipoCliente.all
    @periodos = Periodo.all
  end
end
