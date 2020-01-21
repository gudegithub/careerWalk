# -*- encoding : utf-8 -*-
class UserJob < ApplicationRecord
  belongs_to :user
  belongs_to :job
end
