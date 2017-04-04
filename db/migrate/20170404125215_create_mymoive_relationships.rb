class CreateMymoiveRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :mymoive_relationships do |t|
      t.integer :mymoive_id
      t.integer :user_id

      t.timestamps
    end
  end
end
