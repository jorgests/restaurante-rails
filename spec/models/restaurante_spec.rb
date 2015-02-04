require 'rails_helper'

describe Restaurante do
  subject { Restaurante.new }

  it 'saves object' do
    subject.nome = 'Jorge Alberto'
    subject.endereco = 'rua: dos testes n 521'
    subject.especialidade = 'Comida brasileira'

    expect(subject.save).to eq(true)
  end

  context 'when name is invalid' do
    it 'will not save object' do
      subject.nome = 'jorge Alberto'
      subject.endereco = 'endereço'
      subject.especialidade = 'Comida brasileira'

      expect(subject.save).to eq(false)
    end
  end
end