class RenameFornecedorsToFornecedores < ActiveRecord::Migration
  def change
    rename_table :fornecedors, :fornecedores
  end
end
