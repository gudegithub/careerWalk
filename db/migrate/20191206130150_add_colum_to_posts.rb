# -*- encoding : utf-8 -*-
class AddColumToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :room_id, :integer
  end
end
