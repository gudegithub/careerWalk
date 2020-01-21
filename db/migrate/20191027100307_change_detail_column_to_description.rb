# -*- encoding : utf-8 -*-
class ChangeDetailColumnToDescription < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :detail, :string
    add_column :events, :description, :text
  end
end
