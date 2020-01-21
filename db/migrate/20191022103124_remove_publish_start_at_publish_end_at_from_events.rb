# -*- encoding : utf-8 -*-
class RemovePublishStartAtPublishEndAtFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :publish_start_at, :timestamp
    remove_column :events, :publish_end_at, :timestamp
  end
end
