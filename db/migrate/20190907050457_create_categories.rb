# -*- encoding : utf-8 -*-
class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :slug, limit: 45
      t.boolean :publish_flg

      t.timestamps
    end
  end
end
