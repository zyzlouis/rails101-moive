class ChangeMoiveIdForReview < ActiveRecord::Migration[5.0]
  def change
    rename_column :reviews, :moive_id, :mymoive_id
  end
end
