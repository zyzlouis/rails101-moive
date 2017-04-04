class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :mymoives
  has_many :reviews

  has_many :mymoive_relationships
  has_many :reviewed_mymoives, :through => :mymoive_relationships, :source => :mymoive   
end
