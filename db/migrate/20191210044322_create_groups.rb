# -*- encoding : utf-8 -*-
class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :user_id
      t.integer :owner
      t.timestamps
    end
  end
end
