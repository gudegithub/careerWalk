# -*- encoding : utf-8 -*-
class Message < ApplicationRecord
  after_create_commit { MessageBroadcastJob.perform_later self }
end
