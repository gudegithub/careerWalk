# -*- encoding : utf-8 -*-
class UserEventMailer < ApplicationMailer

  def creation_email(user, event)
    @user = user
    @event = event
    mail(
      subject: 'イベント参加完了メール',
      to: @user.email,
      from: 'creerWalk@example.com'
    )
  end
end
