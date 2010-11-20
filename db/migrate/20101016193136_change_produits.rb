class ChangeProduits < ActiveRecord::Migration
  def self.up
    change_table :produits do |t|
      t.remove :prix
      t.decimal :prix
      t.string :ref
    end
  end

  def self.down
    change_table :produits do |t|
      t.remove :prix
      t.integer :prix
      t.remove :ref
    end
  end
end
