class Review < ApplicationRecord
  belongs_to :user
  belongs_to :mymoive
  
  validates :content, presence: true

end
