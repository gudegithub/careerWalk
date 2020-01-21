# -*- encoding : utf-8 -*-
class UserGroup < ApplicationRecord

  belongs_to :user
  belongs_to :group
  validates :user_id,presence: true
  validates :group_id,presence: true

end
