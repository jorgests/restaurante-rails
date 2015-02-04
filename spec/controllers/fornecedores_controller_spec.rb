require 'rails_helper'

describe FornecedoresController, type: :controller do
  it "instantiate the correct controller" do
    expect(controller).to be_an_instance_of(FornecedoresController)
  end

  describe "#new" do
    it "renders successfully" do
      get :new # Faz requisição FornecedoresController#new

      expect(response.status).to be 200 # Response Code
      expect(assigns(:fornecedor)).to be_an_instance_of(Fornecedor)
      assert_template :new
    end
  end

  describe "#create" do
    it "creates successfully and redirects to list" do
      fornecedor_params = {
        nome: 'Fulano',
        endereco: 'Rua teste'
      }

      post :create, fornecedor: fornecedor_params
      expect(response.status).to be 302
      assert_redirected_to fornecedores_path
      expect(flash[:notice]).to eq 'Cadastro executado com sucesso.'
    end

    context "without name" do
      it "fails to create" do
        fornecedor_params = {
          endereco: 'Rua teste'
        }

        post :create, fornecedor: fornecedor_params

        expect(response.status).to be 412
        assert_template :new
        expect(assigns(:fornecedor).endereco).to eq 'Rua teste'
        expect(flash[:error]).to eq 'Erro ao cadastrar'
      end
    end
  end
end
