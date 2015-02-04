class Comentario < ActiveRecord::Base
  belongs_to :comentavel, polymorphic: true

  validates_presence_of :comentavel
  validates_presence_of :conteudo
end
