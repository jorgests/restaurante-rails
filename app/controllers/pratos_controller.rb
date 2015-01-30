class PratosController < ApplicationController
  def index
    @pratos = Prato.where(restaurante_id: params[:restaurante_id])
  end
end