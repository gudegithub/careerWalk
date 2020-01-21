# -*- encoding : utf-8 -*-
class AddOwnerToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :owner, :string
  end
end
