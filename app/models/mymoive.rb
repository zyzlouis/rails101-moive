class Mymoive < ApplicationRecord
  belongs_to :user
  has_many :reviews
  validates :name, presence: true

  has_many :mymoive_relationships
  has_many :viewers,through: :mymoive_relationships, source: :user
end
