# -*- encoding : utf-8 -*-
class UserRoom < ApplicationRecord
  belongs_to :user
  belongs_to :room
end
