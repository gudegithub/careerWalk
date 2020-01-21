# -*- encoding : utf-8 -*-
class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :name
      t.timestamp :publish_start_at
      t.timestamp :publish_end_at
      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
