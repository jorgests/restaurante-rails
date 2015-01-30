class HelloWorldController < ApplicationController
  def index
    hello
  end

  def hello
    render :text => "Helddddddlo World!"
  end

  def create
    nome = params['nome']
  end
end