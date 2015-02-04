class Fornecedor < ActiveRecord::Base
  validates_presence_of :nome, message: 'deve ser preenchido'
  validates_presence_of :endereco, message: 'deve ser preenchido'
end