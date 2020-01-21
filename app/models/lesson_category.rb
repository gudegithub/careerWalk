# -*- encoding : utf-8 -*-
class LessonCategory < ApplicationRecord
  belongs_to :lesson
  belongs_to :cateory
end
