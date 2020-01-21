# -*- encoding : utf-8 -*-
class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event

  enum attend_status: { before_join: 0, after_join: 1 }

  #出席の状態を切り替えるメソッド
  def check_attend!
    if before_join?
      after_join!
    else
      before_join!
    end
  end
end
