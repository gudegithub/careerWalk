# -*- encoding : utf-8 -*-
class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :university, :string
    add_column :users, :uid, :string
    add_column :users, :provider, :string
  end
end
