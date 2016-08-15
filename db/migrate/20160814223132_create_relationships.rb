class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :trusting_id
      t.integer :trusted_by_id
      
      t.timestamps null: false
    end
    add_index :relationships, :trusting_id
    add_index :relationships, :trusted_by_id
    add_index :relationships, [:trusting_id, :trusted_by_id], unique: true
  end
end