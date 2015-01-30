class RestaurantesController < ApplicationController

  def index
    # require 'pry'; binding.pry
    @restaurantes = Restaurante.order("nome")
  end

  def show
    @restaurante = Restaurante.find(params[:id])
  end

  def by_name
    @restaurante = Restaurante.find_by_nome(params[:nome])

    if @restaurante
      render :show
    else
      flash[:error] = "Não existe Restaurante com o nome #{params[:nome]}"
      redirect_to restaurantes_path
    end
  end

  def open
    restaurante = Restaurante.find(params[:id])
    flash[:notice] = "Restaurante #{restaurante.nome} está aberto."
    redirect_to restaurantes_path
  end

  def close
    restaurante = Restaurante.find(params[:id])
    flash[:notice] = "Restaurante #{restaurante.nome} está fechado."
    redirect_to restaurantes_path
  end

  def new
    @restaurante = Restaurante.new
  end

  def create
    @restaurante = Restaurante.new(restaurante_params)
    if @restaurante.save
      flash[:notice] = "Restaurante criado com sucesso."
      redirect_to(:action => "show", :id => @restaurante)
    else
      render :action => "new"
    end

  end

  def edit
    @restaurante = Restaurante.find(params[:id])
  end

  def update
    @restaurante = Restaurante.find(params[:id])

    if @restaurante.update_attributes(restaurante_params)
      flash[:notice] = "Restaurante alterado com sucesso."
      redirect_to(:action => "show", :id => @restaurante)
    else
      render :action => "edit"
    end
  end

  def destroy
    @restaurante = Restaurante.find(params[:id])
    @restaurante.destroy
    redirect_to(:action => "index")
  end

  private

  def restaurante_params
    params.require(:restaurante).permit(:nome, :endereco, :especialidade)
  end
end