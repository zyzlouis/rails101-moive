class MymoiveRelationship < ApplicationRecord
  belongs_to :mymoive
  belongs_to :user

  has_many :mymoive_relationships
  has_many :viewers,through: :mymoive_relationships, source: :user
end
