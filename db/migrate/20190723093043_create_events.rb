# -*- encoding : utf-8 -*-
class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :image
      t.string :location
      t.string :date
      t.string :url
      t.timestamps
    end
  end
end
