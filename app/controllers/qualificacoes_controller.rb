class QualificacoesController < ApplicationController
  def index
    if params[:restaurante_id]
      @qualificacoes = Qualificacao.where(restaurante_id: params[:restaurante_id])
    else
      @qualificacoes = Qualificacao.all
    end
  end

  def new
    @qualificacao = Qualificacao.new

    if params[:cliente]
      @qualificacao.cliente = Cliente.find(params[:cliente])
    end
    if params[:restaurante]
      @qualificacao.restaurante = Restaurante.find(params[:restaurante])
    end

  end

  def edit
  end

  def show
    @qualificacao = Qualificacao.find(params[:id])

    respond_to do |format|
      format.html
      format.xml { render xml: @qualificacao }
      format.json { render json: @qualificacao }
    end
  end

  def create
    @qualificacao = Qualificacao.new(qualificacao_params)
    if @qualificacao.save
      flash[:notice] = "Qualificação criado com sucesso."
      redirect_to(:action => "show", :id => @qualificacao)
    else
      render :action => "new"
    end
  end

  private

  def qualificacao_params
    params.require(:qualificacao).permit(:cliente_id, :restaurante_id, :nota, :valor_gasto)
  end

end
