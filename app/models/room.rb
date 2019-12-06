class Room < ApplicationRecord
  has_many :posts

  has_many :user_rooms
  has_many :users, through: :user_rooms
end
