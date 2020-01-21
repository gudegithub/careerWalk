# -*- encoding : utf-8 -*-
class UserLesson < ApplicationRecord
  belongs_to :user
  belongs_to :lesson
end
