class CreateFornecedors < ActiveRecord::Migration

  def change
    create_table :fornecedors do |t|
      t.string :nome, :limit => 100
      t.string :endereco, :limit => 80
    end
  end
end
