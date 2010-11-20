class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string    :login,               :null => false                # optional, you can use email instead, or both
      t.integer   :role,                :default => 3
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
