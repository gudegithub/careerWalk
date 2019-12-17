class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event

  enum status: { before_join: 0, after_join: 1 }
end
