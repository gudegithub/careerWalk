# -*- encoding : utf-8 -*-
class EditEventsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :publish_start_at, :timestamp
    add_column :events, :publish_end_at, :timestamp
    add_column :events, :publish_flg, :boolean
    add_column :events, :deleted_at, :timestamp
    add_reference :events, :upload_file, index: true
  end
end
