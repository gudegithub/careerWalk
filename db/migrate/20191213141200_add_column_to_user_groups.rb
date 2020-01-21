# -*- encoding : utf-8 -*-
class AddColumnToUserGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :user_groups, :groupJoined_id, :integer
    add_column :user_groups, :groupJoiner_id, :integer
  end
end
