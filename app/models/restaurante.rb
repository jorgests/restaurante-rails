class Restaurante < ActiveRecord::Base

  validates_presence_of :nome, :message => 'deve ser preenchido'
  validates_presence_of :endereco, :message => 'deve ser preenchido'
  validates_presence_of :especialidade, :message => 'deve ser preenchido'
  validate :primeira_letra_deve_ser_maiuscula

  validates_uniqueness_of :nome, :message => 'já cadastrado'
  validates_uniqueness_of :endereco, :message => 'já cadastrado'

  has_many :qualificacoes
  has_and_belongs_to_many :pratos

  has_many :comentarios, as: :comentavel

  private

  def primeira_letra_deve_ser_maiuscula
    errors.add('nome', 'da primeira letra deve ser maiuscula') unless nome =~/^[A-Z].*/
  end
end