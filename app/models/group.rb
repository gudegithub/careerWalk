# -*- encoding : utf-8 -*-
class Group < ApplicationRecord
  validates :name, presence: true
  validates :description,presence: true
  validates :image,presence: true
  has_many :user_groups
  has_many :users,through: :user_groups
  mount_uploader :image, ImageUploader


end
