class FornecedoresController < ApplicationController
  def index
    # require 'pry';binding.pry
    @fornecedores = Fornecedor.all
  end

  def new
    @fornecedor = Fornecedor.new
  end

  def create
    @fornecedor = Fornecedor.new(fornecedores_params)
    if @fornecedor.save
      redirect_to fornecedores_path
      flash[:notice] = 'Cadastro executado com sucesso.'
    else
      flash[:error] = 'Erro ao cadastrar'
      render :new, status: :precondition_failed
    end
  end

  def show
    @fornecedor = Fornecedor.find(params[:id])
  end

  private

  def fornecedores_params
    params.require(:fornecedor).permit(:nome, :endereco)
  end

end
