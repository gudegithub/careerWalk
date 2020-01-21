# -*- encoding : utf-8 -*-
class AddDeleteAtToUser < ActiveRecord::Migration[5.2]
  def change
      add_column :users, :deleted_at, :timestamp
  end
end
