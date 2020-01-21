# -*- encoding : utf-8 -*-
class AddStatusColumnToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :status, :integer, default: 0, null: false
  end
end
