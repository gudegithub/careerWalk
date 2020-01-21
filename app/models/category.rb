# -*- encoding : utf-8 -*-
class Category < ApplicationRecord
  has_many :event_categories, dependent: :destroy
  has_many :event, through: :event_categories
  validates :name, presence: true
end
