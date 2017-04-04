class Mymoive < ApplicationRecord
  belongs_to :user
  has_many :reviews
  validates :name, presence: true
end
