require 'rails_helper'

describe Comentario do

#   it 'has a name' do
#     não pode salvar Comentario sem comentavel (restaurante e qualidade)
#     # expect(described_class.last.nome).to eq 'Fasano'
#   end

  subject { Comentario.new }

  it 'saves object' do
    subject.conteudo = 'Jorge Alberto'
    subject.comentavel = Restaurante.create(nome: 'Jorge', endereco: 'rua das acacias')

    expect(subject.save).to eq(true)
  end

  context 'when comentavel does not exist' do
    it 'will not save object' do
      subject.conteudo = 'jorge Alberto'
      subject.comentavel = nil

      expect(subject.save).to eq(false)
    end
  end
end